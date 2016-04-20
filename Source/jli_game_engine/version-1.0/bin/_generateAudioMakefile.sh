GAMEPLAYSCRIPTS_ABSOLUTEPATH=${1}

_SCRIPTS=/../assets/sounds
_WAV=wav
_OGG=ogg

SCRIPTS_ABSOLUTEPATH=${GAMEPLAYSCRIPTS_ABSOLUTEPATH}${_SCRIPTS}

GAMEPLAYSCRIPTS=.
SCRIPTS=${GAMEPLAYSCRIPTS}/../assets/sounds

rm -rf ${SCRIPTS_ABSOLUTEPATH}/*

TARGET='all: '

>&2 echo "accumulate the directory targets..."
for i in $(find ${GAMEPLAYSCRIPTS_ABSOLUTEPATH} -type d -not -path "*audacity*" -not -path "*hydrogen*" -not -path "*/_*")
do
	if [ "${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}}" != "" ]
	then
    TARGET="${TARGET} ${SCRIPTS_ABSOLUTEPATH}/${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}/}" 
	fi
done



>&2 echo "accumulate the file targets..."
for i in $(find ${GAMEPLAYSCRIPTS_ABSOLUTEPATH} -type f -name "*.wav" -not -path "*/audacity/*" -not -path "*/hydrogen/*" -not -path "*/_*" )
do

  FILE=${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}}
  TO=${SCRIPTS}${FILE}
  FULLPATH=${TO%.${_WAV}}.${_OGG}

  TARGET="${TARGET} ${FULLPATH}"
done

echo $TARGET
echo ''





>&2 echo "list the file targets..."
for i in $(find ${GAMEPLAYSCRIPTS_ABSOLUTEPATH} -type f -name "*.wav" -not -path "*/audacity/*" -not -path "*/hydrogen/*" -not -path "*/_*" )
do
  FILE=${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}}
  TO=${SCRIPTS}${FILE}
  FULLPATH=${TO%.${_WAV}}.${_OGG}

  echo ${FULLPATH}: ${GAMEPLAYSCRIPTS}${FILE}
  echo '\t./../bin/sox' ${GAMEPLAYSCRIPTS}${FILE} ${FULLPATH}
  echo ''
done

>&2 echo "list the directory targets..."
for i in $(find ${GAMEPLAYSCRIPTS_ABSOLUTEPATH} -type d -not -path "*audacity*" -not -path "*hydrogen*" -not -path "*/_*")
do
  if [ "${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}}" != "" ]
  then
    echo ${SCRIPTS_ABSOLUTEPATH}/${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}/}:
    echo '\tmkdir -p ' ${SCRIPTS}/${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}/}
    echo ''
  fi
done

>&2 echo "done..."
