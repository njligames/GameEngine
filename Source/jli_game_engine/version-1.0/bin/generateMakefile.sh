#PROJECT=GameEngine
PROJECT=YappyBirds

SOURCE=/Users/jamesfolk/NJLI/${PROJECT}/COMMON
pushd /Users/jamesfolk/NJLI/GameEngine/Source/jli_game_engine/version-1.0/bin
./_generateMakefile ${SOURCE} > ${SOURCE}/Makefile
popd

