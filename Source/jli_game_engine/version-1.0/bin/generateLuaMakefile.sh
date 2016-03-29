SOURCE=/Users/jamesfolk/NJLI/GameEngine/COMMON/gameplay_scripts

pushd /Users/jamesfolk/NJLI/GameEngine/Source/jli_game_engine/version-1.0/bin
./_generateLuaMakefile ${SOURCE} 'perl /users/jamesfolk/NJLI/GameEngine/COMMON/bin/removeComments.pl' > ${SOURCE}/Makefile
popd

