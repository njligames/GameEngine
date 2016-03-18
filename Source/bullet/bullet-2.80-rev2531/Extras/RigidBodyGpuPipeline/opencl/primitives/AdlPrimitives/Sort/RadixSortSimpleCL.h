static const char* radixSortSimpleKernelsCL = \
	"#pragma OPENCL EXTENSION cl_amd_printf : enable\n"
	"#pragma OPENCL EXTENSION cl_khr_local_int32_base_atomics : enable\n"
	"\n"
	"typedef unsigned int u32;\n"
	"#define GET_GROUP_IDX get_group_id(0)\n"
	"#define GET_LOCAL_IDX get_local_id(0)\n"
	"#define GET_GLOBAL_IDX get_global_id(0)\n"
	"#define GET_GROUP_SIZE get_local_size(0)\n"
	"#define GROUP_LDS_BARRIER barrier(CLK_LOCAL_MEM_FENCE)\n"
	"#define AtomInc(x) atom_inc(&(x))\n"
	"#define AtomInc1(x, out) out = atom_inc(&(x))\n"
	"\n"
	"\n"
	"#define WG_SIZE 128\n"
	"#define NUM_PER_WI 4\n"
	"\n"
	"\n"
	"typedef struct\n"
	"{\n"
	"	u32 m_key;\n"
	"	u32 m_value;\n"
	"}SortData;\n"
	"\n"
	"\n"
	"typedef struct\n"
	"{\n"
	"	u32 m_startBit;\n"
	"	u32 m_numGroups;\n"
	"	u32 m_padding[2];\n"
	"} ConstBuffer;\n"
	"\n"
	"\n"
	"__kernel\n"
	"__attribute__((reqd_work_group_size(WG_SIZE,1,1)))\n"
	"void LocalCountKernel(__global SortData* sortData,\n"
	"						__global u32* ldsHistogramOut,\n"
	"						ConstBuffer cb)\n"
	"{\n"
	"	__local u32 ldsHistogram[16][256];\n"
	"\n"
	"	int lIdx = GET_LOCAL_IDX;\n"
	"	int gIdx = GET_GLOBAL_IDX;\n"
	"\n"
	"	for(int i=0; i<16; i++)\n"
	"	{\n"
	"		ldsHistogram[i][lIdx] = 0.f;\n"
	"		ldsHistogram[i][lIdx+128] = 0.f;\n"
	"	}\n"
	"\n"
	"	GROUP_LDS_BARRIER;\n"
	"\n"
	"	SortData datas[NUM_PER_WI];\n"
	"	datas[0] = sortData[gIdx*NUM_PER_WI+0];\n"
	"	datas[1] = sortData[gIdx*NUM_PER_WI+1];\n"
	"	datas[2] = sortData[gIdx*NUM_PER_WI+2];\n"
	"	datas[3] = sortData[gIdx*NUM_PER_WI+3];\n"
	"\n"
	"	datas[0].m_key = (datas[0].m_key >> cb.m_startBit) & 0xff;\n"
	"	datas[1].m_key = (datas[1].m_key >> cb.m_startBit) & 0xff;\n"
	"	datas[2].m_key = (datas[2].m_key >> cb.m_startBit) & 0xff;\n"
	"	datas[3].m_key = (datas[3].m_key >> cb.m_startBit) & 0xff;\n"
	"\n"
	"	int tableIdx = lIdx%16;\n"
	"\n"
	"	AtomInc(ldsHistogram[tableIdx][datas[0].m_key]);\n"
	"	AtomInc(ldsHistogram[tableIdx][datas[1].m_key]);\n"
	"	AtomInc(ldsHistogram[tableIdx][datas[2].m_key]);\n"
	"	AtomInc(ldsHistogram[tableIdx][datas[3].m_key]);\n"
	"\n"
	"	GROUP_LDS_BARRIER;\n"
	"\n"
	"	u32 sum0, sum1;\n"
	"	sum0 = sum1 = 0;\n"
	"	for(int i=0; i<16; i++)\n"
	"	{\n"
	"		sum0 += ldsHistogram[i][lIdx];\n"
	"		sum1 += ldsHistogram[i][lIdx+128];\n"
	"	}\n"
	"\n"
	"	ldsHistogramOut[lIdx*cb.m_numGroups+GET_GROUP_IDX] = sum0;\n"
	"	ldsHistogramOut[(lIdx+128)*cb.m_numGroups+GET_GROUP_IDX] = sum1;\n"
	"}\n"
	"\n"
	"__kernel\n"
	"__attribute__((reqd_work_group_size(WG_SIZE,1,1)))\n"
	"void ScatterKernel(__global SortData* sortData,\n"
	"					__global SortData* sortDataOut,\n"
	"					__global u32* scannedHistogram,\n"
	"					ConstBuffer cb)\n"
	"{\n"
	"	__local u32 ldsCurrentLocation[256];\n"
	"\n"
	"	int lIdx = GET_LOCAL_IDX;\n"
	"	int gIdx = GET_GLOBAL_IDX;\n"
	"\n"
	"	{\n"
	"		ldsCurrentLocation[lIdx] = scannedHistogram[lIdx*cb.m_numGroups+GET_GROUP_IDX];\n"
	"		ldsCurrentLocation[lIdx+128] = scannedHistogram[(lIdx+128)*cb.m_numGroups+GET_GROUP_IDX];\n"
	"	}\n"
	"\n"
	"	GROUP_LDS_BARRIER;\n"
	"\n"
	"	SortData datas[NUM_PER_WI];\n"
	"	int keys[NUM_PER_WI];\n"
	"	datas[0] = sortData[gIdx*NUM_PER_WI+0];\n"
	"	datas[1] = sortData[gIdx*NUM_PER_WI+1];\n"
	"	datas[2] = sortData[gIdx*NUM_PER_WI+2];\n"
	"	datas[3] = sortData[gIdx*NUM_PER_WI+3];\n"
	"\n"
	"	keys[0] = (datas[0].m_key >> cb.m_startBit) & 0xff;\n"
	"	keys[1] = (datas[1].m_key >> cb.m_startBit) & 0xff;\n"
	"	keys[2] = (datas[2].m_key >> cb.m_startBit) & 0xff;\n"
	"	keys[3] = (datas[3].m_key >> cb.m_startBit) & 0xff;\n"
	"\n"
	"	int dst[NUM_PER_WI];\n"
	"	for(int i=0; i<WG_SIZE; i++)\n"
	"	{\n"
	"		if( i==lIdx )\n"
	"		{\n"
	"			AtomInc1(ldsCurrentLocation[keys[0]], dst[0]);\n"
	"			AtomInc1(ldsCurrentLocation[keys[1]], dst[1]);\n"
	"			AtomInc1(ldsCurrentLocation[keys[2]], dst[2]);\n"
	"			AtomInc1(ldsCurrentLocation[keys[3]], dst[3]);\n"
	"		}\n"
	"		GROUP_LDS_BARRIER;\n"
	"	}\n"
	"	sortDataOut[dst[0]] = datas[0];\n"
	"	sortDataOut[dst[1]] = datas[1];\n"
	"	sortDataOut[dst[2]] = datas[2];\n"
	"	sortDataOut[dst[3]] = datas[3];\n"
	"}\n"
	"\n"
	"";