#PROJECT=/Users/jamesfolk/Dropbox/GameEngine
PROJECT=/Users/jamesfolk/Dropbox/YappyBirds
GAMEENGINE=/Users/jamesfolk/Dropbox/GameEngine

SOURCE=${PROJECT}/COMMON
WORKING_DIRECTORY=.

pushd ${GAMEENGINE}/Source/jli_game_engine/version-1.0/bin
./_generateMakefile.sh ${WORKING_DIRECTORY} > ${SOURCE}/Makefile
popd

