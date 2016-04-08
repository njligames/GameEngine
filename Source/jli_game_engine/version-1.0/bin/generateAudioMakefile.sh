#PROJECT=GameEngine
PROJECT=YappyBirds

SOURCE=/Users/jamesfolk/NJLI/${PROJECT}/COMMON/audio
pushd /Users/jamesfolk/NJLI/GameEngine/Source/jli_game_engine/version-1.0/bin
./_generateAudioMakefile ${SOURCE} /usr/local/bin/sox > ${SOURCE}/Makefile
popd

