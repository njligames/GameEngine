//
//  WorldResourceLoader.cpp
//  JLIGameEngineTest
//
//  Created by James Folk on 11/21/14.
//  Copyright (c) 2014 James Folk. All rights reserved.
//

#include "WorldResourceLoader.h"
#include "JLIFactoryTypes.h"
#include "World.h"
#include "WorldResourceLoader.h"

#include "ParticleEmitter.h"
#include "Light.h"
#include "Image.h"
#include "Geometry.h"
#include "ShaderProgram.h"
#include "Font.h"
#include "Lua.h"
#include "Xml.h"
#include "JsonJLI.h"
#include "Image.h"
#include "Sound.h"
#include "Material.h"
#include "Skinner.h"
#include "Camera.h"

#include "File.h"

#include "stb_image.h"

#include "Log.h"

#include "unzip.h"

#define TAG "WORLDRESOURCELOADER.CPP"
#define FORMATSTRING "{\"njli::WorldResourceLoader\":[]}"
#include "btPrint.h"

#include "PVRTTexture.h"

namespace njli
{
    WorldResourceLoader::WorldResourceLoader()
    {
        
    }
    WorldResourceLoader::~WorldResourceLoader()
    {
        unLoadAll();
    }
    const char *WorldResourceLoader::getClassName()const
    {
        return "WorldResourceLoader";
    }
    
    
    
    bool WorldResourceLoader::setPvrImage(const char *filePath, Image &img)
    {
        const void *content;
        unsigned long file_size;
        
        if(njli::World::getInstance()->getWorldResourceLoader()->loadDataFromFile(filePath,
                                                                               &content,
                                                                               &file_size))
        {
            PVRTextureHeaderV3 *header = (PVRTextureHeaderV3*)content;
//
            img.setPVRData((u8*)content, PVRTGetTextureDataSize(*header), filePath);
            
            return true;
        }
        
        return false;
    }
    
    s32 WorldResourceLoader::getType()const
    {
        return JLI_OBJECT_TYPE_WorldResourceLoader;
    }
    WorldResourceLoader::operator std::string() const
    {
        return njli::JsonJLI::parse(string_format("%s", FORMATSTRING).c_str());
    }
    
#define ROUND(val,places) (roundf(val * pow(10,places)) / (pow(10,places)))
//    float rounded_down = floorf(val * 100) / 100;   /* Result: 37.77 */
//    float nearest = roundf(val * 100) / 100;  /* Result: 37.78 */
//    float rounded_up = ceilf(val * 100) / 100;      /* Result: 37.78 */
    
    bool WorldResourceLoader::load(const char *filePath, Image &img)
    {
        char buffer[2048] = "";
        sprintf(buffer, "%s", filePath);
        
        char *s = strtok(buffer, "%");
        char *end = strtok(NULL, "%");
        if (end)
        {
            char buffer2[8];
            strcpy(buffer2, end);
            sprintf(buffer, "%s", s);
            f32 aspect = ROUND(njli::World::getInstance()->getAspectRatio(), 1);
            f32 ratio1 = ROUND(3.0f/2.0f, 1);
            f32 ratio2 = ROUND(16.0f/9.0f, 1);
            f32 ratio3 = ROUND(4.0f/3.0f, 1);
            
            //8:5
            //128 : 75
            //5 : 3
            
            if(aspect == ratio1)
            {
                strcat(buffer, "_3_2_");
            }
            else if(aspect == ratio2)
            {
                strcat(buffer, "_16_9_");
            }
            else if(aspect == ratio3)
            {
                strcat(buffer, "_4_3_");
            }
            
            strcat(buffer, buffer2);
        }
        
        
        
//        Image *const*cachedImage = m_Images.find(btHashString(filePath));
        
//        if(!cachedImage)
        {
            s32 req_comp = 0;
            s32 x, y, comp;
            unsigned char *fileContent = stbi_load(ASSET_PATH(buffer), &x, &y, &comp, req_comp);
            
            u32 pixel_count = x * y;
            bool hasAlpha = false;
            if(comp == 4)
            {
                for (s32 i = 0, color = 0; i < pixel_count && !hasAlpha; ++i,color+=4)
                {
                    unsigned char alpha = fileContent[color + 3];
                    if (alpha != 0xFF)
                    {
                        hasAlpha = true;
                    }
                }
            }
            img.m_hasAlpha = hasAlpha;
            
            
            if(fileContent)
            {
//                Image *img = Image::create();
                
//                if(img)
                {
                    img.setDataRawFromWorldResourceLoader(fileContent, x, y, comp, buffer);
//                    img.flip();
//                    m_Images.insert(btHashString(buffer), img);
//                    image = *img;
                    
                    stbi_image_free(fileContent);
                    
                    return true;
                }
            }
            else
            {
                if(!setPvrImage(filePath, img))
                {
                    DEBUG_LOG_PRINT_V(TAG, "Error (%s) : %s", stbi_failure_reason(), buffer);
                    
    //                Image *img = Image::create();
                    
    //                if(img)
                    {
    //                    img->setDataRawFromWorldResourceLoader(fileContent, x, y, comp, filePath);
                        img.generate(256, 256, 4, btVector4(1.0, 0.0, 1.0, 1.0));
    //                    m_Images.insert(btHashString(filePath), img);
    //                    image = *img;
                        
                        stbi_image_free(fileContent);
                        
                        return true;
                    }
                }
            }
            return false;
        }
        
        return true;
    }
    
    bool WorldResourceLoader::load(const char *filePath, ParticleEmitter *object)
    {
        DEBUG_ASSERT(object);
        
        const void *buffer;
        char *_fileContent;
        unsigned long fileSize;
        
        loadDataFromFile(filePath, &buffer, &fileSize);
        _fileContent = (char*)buffer;
        
        if (_fileContent)
        {
            _fileContent[fileSize] = '\0';
            
            object->parseFileData(_fileContent);
            return true;
        }
        return false;
    }
    
    bool WorldResourceLoader::load(const char *vertexFile,
                                   const char *fragmentFile,
                                   ShaderProgram *shader)
    {
        DEBUG_ASSERT(shader);
        
        const void *buffer;
        char *fileContent;
        unsigned long fileSize;
        
        loadDataFromFile(vertexFile, &buffer, &fileSize);
        fileContent = (char*)buffer;
        fileContent[fileSize] = '\0';
        std::string vertexFileContent(fileContent);
        
        loadDataFromFile(fragmentFile, &buffer, &fileSize);
        fileContent = (char*)buffer;
        fileContent[fileSize] = '\0';
        std::string fragmentFileContent(fileContent);
        
        shader->saveSource(vertexFileContent, fragmentFileContent);
        
//        if(vertexFileContent != "")
//        {
//            if(!shader->compile(vertexFileContent.c_str(), JLI_SHADER_TYPE_VERTEX))
//            {
//                DEBUG_LOG_PRINT_E(TAG, "Vertex log: %s", shader->vertexShaderLog());
//                return false;
//            }
//        }
//        else
//        {
//            DEBUG_LOG_PRINT_W(TAG, "Content from %s was empty", vertexFile);
//            return false;
//        }
//        
//        if(fragmentFileContent != "")
//        {
//            if(!shader->compile(fragmentFileContent.c_str(), JLI_SHADER_TYPE_FRAGMENT))
//            {
//                DEBUG_LOG_PRINT_E(TAG, "Fragment log: %s", shader->fragmentShaderLog());
//                return false;
//            }
//        }
//        else
//        {
//            DEBUG_LOG_PRINT_W(TAG, "Content from %s was empty", vertexFile);
//            return false;
//        }
        
        return true;
    }
    
    bool WorldResourceLoader::load(const char *filePath, Sound *object)
    {
        DEBUG_ASSERT(object);
        
        if (filePath)
        {
            const void *content;
            unsigned long file_size;
            loadDataFromFile(filePath, &content, &file_size);
            
            njli::World::getInstance()->getWorldSound()->createSound((const char*)content, file_size, *object);
            
            return true;
        }
        
        return false;
    }
    
    bool WorldResourceLoader::load(const char *filePath, Light *object)
    {
        return false;
    }
    
    bool WorldResourceLoader::load(const char *filePath, Geometry *object)
    {
        return false;
    }
    
    bool WorldResourceLoader::load(const char *filePath, Font *object)
    {
        return false;
    }
    
    bool WorldResourceLoader::load(const char *filePath, Lua *object)
    {
        return false;
    }
    
    bool WorldResourceLoader::load(const char *filePath, Xml *object)
    {
        return false;
    }
    
    bool WorldResourceLoader::load(const char *filePath, JsonJLI *object)
    {
        return false;
    }
    
    bool WorldResourceLoader::load(const char *filePath, Material *object)
    {
        return false;
    }
    
    bool WorldResourceLoader::load(const char *filePath, Skinner *object)
    {
        return false;
    }
    
    bool WorldResourceLoader::load(const char *filePath, Camera *object)
    {
        return false;
    }
    
    bool WorldResourceLoader::load(const char *filePath, const void **content, unsigned long *file_size)
    {
        if (filePath)
        {
            
            loadDataFromFile(filePath, content, file_size);
            
            return true;
        }
        
        content = NULL;
        file_size = 0;
        
        return false;
    }
    
    bool WorldResourceLoader::loadZip(const char *filePath, const char *password)
    {
        static const char *RESOURCE_PATH[] =
        {
            "cameras",
            "curves",
            "fonts",
            "images",
            "lamps",
            "materials",
            "meshes",
            "particles",
            "scripts",
            "shaders",
            "sounds",
            "strings"
        };
        
        unz_global_info gi;
        unz_file_info fi;
        unzFile uf = unzOpen( ASSET_PATH(filePath) );
        unzGetGlobalInfo( uf, &gi );
        unzGoToFirstFile( uf );
        
        int i=0;
        while( i != gi.number_entry )
        {
            char name[ 1024 ] = {""};
            unzGetCurrentFileInfo( uf, &fi, name, 1024, NULL, 0, NULL, 0 );
            
            if( fi.uncompressed_size > 0 )
            {
                if( unzOpenCurrentFilePassword( uf, password ) == UNZ_OK )
                {
                    void *buffer = malloc( fi.uncompressed_size + 1);
//                    buffer[ fi.uncompressed_size ] = 0;
                    uLong _size = fi.uncompressed_size;
                    
                    int error = UNZ_OK;
                    
                    do
                    {
                        error = unzReadCurrentFile( uf, buffer, fi.uncompressed_size );
                        if ( error < 0 )
                        {
//                            DEBUG_LOG_E(TAG, "error %d\n", error);
//                            return false;
                            continue;
                        }
                        
                    } while ( error > 0 );
                    
                    unzCloseCurrentFile( uf );
                    
                    int j = 0;
                    while(j != 12)
                    {
                        char directory[1024];
                        strcpy(directory, name);
                        char * pch = strtok (directory, "/");
                        if(0 == strcmp(RESOURCE_PATH[j], pch) && (strstr(name, "/.DS_Store") == NULL))
                        {
                            
                            const void *p = buffer;
                            bool exists = getFileData(name, &p, &_size);
                            
                            if(!exists)
                            {
                                addFileData(name, p, _size);
                                DEBUG_LOG_V(TAG, "Added file: %s - size: %lu\n", name, _size);
                            }
                            else
                            {
                                DEBUG_LOG_V(TAG, "File exists: %s - size: %lu\n", name, _size);
                            }
                        }
                        ++j;
                    }
                    
                    free(buffer);
                }
                else
                {
                    DEBUG_LOG_E(TAG, "Invalid password %s\n", "");
                    return false;
                }
            }
            
            unzGoToNextFile( uf );
            
            ++i;
        }
        
        unzClose( uf );
        
        return true;
    }
    
    bool WorldResourceLoader::unLoad(const char *filePath)
    {
        return removeFileData(filePath);
//        const char*const * fileContent = m_Files.find(btHashString(filePath));
//        
//        if (fileContent && *fileContent)
//        {
//            m_Files.remove(btHashString(filePath));
//            
//            delete [] fileContent;
//            
//            return true;
//        }
        
//        Image*const * cachedImage = m_Images.find(btHashString(filePath));
        
//        if (cachedImage && *cachedImage)
//        {
//            Image::destroy(*cachedImage);
//            m_Images.remove(btHashString(filePath));
//            
//            return true;
//        }
        
//        return false;
    }
    
    bool WorldResourceLoader::unLoadAll()
    {
        for (s32 i = 0; i < m_FileData.size(); ++i)
        {
            FileData *const *cachedFileContent = m_FileData.getAtIndex(i);
            
            if(cachedFileContent)
            {
//                free((*cachedFileContent)->buffer);
                delete cachedFileContent;cachedFileContent=NULL;
            }
        }
        m_FileData.clear();
        m_HashKeys.clear();
        
//        for (s32 i = 0; i < m_Images.size(); ++i)
//        {
//            Image*const * cachedImage = m_Images.getAtIndex(i);
//            if(World::getInstance()->getWorldFactory()->has(*cachedImage))
//                Image::destroy(*cachedImage);
//        }
//        m_Images.clear();
        
        return true;
    }
    
    void WorldResourceLoader::remove(const char *filePath)
    {
//        Image *const*cachedImage = m_Images.find(btHashString(filePath));
//        
//        if (cachedImage && *cachedImage)
//        {
//            m_Images.remove(btHashString(filePath));
//        }
    }
    
    const void *WorldResourceLoader::addFileData(const char *filePath, const void *buffer, unsigned long size)
    {
        if(!getFileData(filePath, &buffer, &size))
        {
            FileData *f = new FileData(buffer, size);
//            f->buffer = buffer;
//            f->fileSize = size;
            
            std::string _filePath(filePath);
            m_HashKeys.push_back(_filePath);
            m_FileData.insert(btHashString(_filePath.c_str()), f);
            
            return f->getBuffer();
        }
        return buffer;
    }
    
    bool WorldResourceLoader::removeFileData(const char *filePath)
    {
        FileData * cachedFileContent = *m_FileData.find(btHashString(filePath));
        if(cachedFileContent)
        {
            m_FileData.remove(btHashString(filePath));

            m_HashKeys.erase(std::find(m_HashKeys.begin(), m_HashKeys.end(), std::string(filePath)));
            
//            free(cachedFileContent->buffer);
            delete cachedFileContent;cachedFileContent=NULL;
            return true;
        }
        return false;
    }
    
    bool WorldResourceLoader::getFileData(const char *filePath, const void **buffer, unsigned long *size)const
    {
        FileData *const* cachedFileContent = m_FileData.find(btHashString(filePath));
        if (cachedFileContent)
        {
//            *buffer = (*cachedFileContent)->buffer;
//            *size = (*cachedFileContent)->fileSize;
            *buffer = (*cachedFileContent)->getBuffer();
            *size = (*cachedFileContent)->getSize();
            
            return true;
        }
        return false;
    }
    
//    std::string WorldResourceLoader::loadFromFile(const char *filePath, size_t &file_size)
//    {
//        char *const* cachedFileContent = m_Files.find(btHashString(filePath));
//        char *fileContentReturned = NULL;
//        std::string ret("");
//        file_size = 0;
//        
//        if (!cachedFileContent)
//        {
//            char buffer[1024];
//            sprintf(buffer, "%s", ASSET_PATH(filePath));
//            FILE *stream = fopen(buffer, "rb");
//            if(stream)
//            {
//                fseek(stream, 0, SEEK_END);
//                file_size = ftell(stream);
//                fseek(stream, 0, SEEK_SET);
//                
//                fileContentReturned = new char[file_size];
//                
//                fread(fileContentReturned, file_size, 1, stream);
//                
//                assert(ferror(stream) == 0);
//                fclose(stream);
//                
//                fileContentReturned[file_size] = '\0';
//                
//                m_Files.insert(btHashString(filePath), fileContentReturned);
//                
//                ret = std::string(fileContentReturned);
//                
////                delete [] fileContentReturned;
//            }
//        }
//        else
//        {
//            ret = std::string(*cachedFileContent);
//        }
//        
//        return ret;
//    }
    
    bool WorldResourceLoader::loadDataFromFile(const char *filePath, const void **buff, unsigned long *length)
    {
        if(!getFileData(filePath, buff, length))
        {
            char buffer[2048];
            sprintf(buffer, "%s", ASSET_PATH(filePath));
//            FILE *file = fopen(buffer, "rb");
            FILE *file = njli_fopen(buffer, "rb");
            
            if(file)
            {
                fseek(file, 0, SEEK_END);
                long len = ftell(file);
                fseek(file, 0, SEEK_SET);
                
                void *mem = malloc(len);
                fread(mem, 1, len, file);
                
                fclose(file);
                
//                *buff = mem;
                *length = len;
                
                *buff = addFileData(filePath, mem, len);
                
                free(mem);
                
                return true;
            }
            
            DEBUG_LOG_PRINT_W(TAG, "Unable to open the file: %s", filePath);
//            return false;
        }
        return false;
    }
}
