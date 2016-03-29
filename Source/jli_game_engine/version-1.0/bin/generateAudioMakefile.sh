SOURCE=/Users/jamesfolk/NJLI/GameEngine/COMMON/audio

pushd /Users/jamesfolk/NJLI/GameEngine/Source/jli_game_engine/version-1.0/bin
./_generateAudioMakefile ${SOURCE} sox > ${SOURCE}/Makefile
popd

