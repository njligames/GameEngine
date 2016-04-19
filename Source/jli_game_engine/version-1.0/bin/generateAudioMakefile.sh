#PROJECT=GameEngine
_PROJECT=YappyBirds

_PROJECT_PATH=/Users/jamesfolk/NJLI/${_PROJECT}

GAMEPLAYSCRIPTS_ABSOLUTEPATH=${_PROJECT_PATH}/COMMON/audio

./_generateAudioMakefile.sh ${GAMEPLAYSCRIPTS_ABSOLUTEPATH} > ${GAMEPLAYSCRIPTS_ABSOLUTEPATH}/Makefile





#PROJECT=GameEngine
# PROJECT=YappyBirds

# SOURCE=/Users/jamesfolk/NJLI/${PROJECT}/COMMON/audio
# pushd /Users/jamesfolk/NJLI/GameEngine/Source/jli_game_engine/version-1.0/bin
# ./_generateAudioMakefile ${SOURCE} /Users/jamesfolk/NJLI/${PROJECT}/COMMON/bin/sox > ${SOURCE}/Makefile
# popd

