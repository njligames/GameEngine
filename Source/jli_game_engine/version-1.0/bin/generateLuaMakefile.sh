#PROJECT=GameEngine
PROJECT=YappyBirds

SOURCE=/Users/jamesfolk/NJLI/${PROJECT}/COMMON/gameplay_scripts
pushd /Users/jamesfolk/NJLI/GameEngine/Source/jli_game_engine/version-1.0/bin
./_generateLuaMakefile ${SOURCE} "perl /users/jamesfolk/NJLI/${PROJECT}/COMMON/bin/removeComments.pl" > ${SOURCE}/Makefile
popd

