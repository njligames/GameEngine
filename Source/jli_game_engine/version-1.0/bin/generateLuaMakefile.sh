#PROJECT=GameEngine
_PROJECT=YappyBirds

_PROJECT_PATH=/Users/jamesfolk/NJLI/${_PROJECT}

GAMEPLAYSCRIPTS_ABSOLUTEPATH=${_PROJECT_PATH}/COMMON/gameplay_scripts

./_generateLuaMakefile.sh ${GAMEPLAYSCRIPTS_ABSOLUTEPATH} > ${GAMEPLAYSCRIPTS_ABSOLUTEPATH}/Makefile
