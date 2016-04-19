#PROJECT=GameEngine
PROJECT=YappyBirds

SOURCE=/Users/jamesfolk/NJLI/${PROJECT}/COMMON
WORKING_DIRECTORY=.

pushd /Users/jamesfolk/NJLI/GameEngine/Source/jli_game_engine/version-1.0/bin
./_generateMakefile.sh ${WORKING_DIRECTORY} > ${SOURCE}/Makefile
popd

