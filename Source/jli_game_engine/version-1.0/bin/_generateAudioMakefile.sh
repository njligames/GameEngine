GAMEPLAYSCRIPTS_ABSOLUTEPATH=${1}

# _GAMEPLAYSCRIPTS=./
_SCRIPTS=/../assets/sounds

SCRIPTS_ABSOLUTEPATH=${GAMEPLAYSCRIPTS_ABSOLUTEPATH}${_SCRIPTS}

GAMEPLAYSCRIPTS=.
SCRIPTS=${GAMEPLAYSCRIPTS}/../assets/sounds

# rm -rf ${SCRIPTS_ABSOLUTEPATH}/*

# >&2 echo "make the directories..."
# for i in $(find ${GAMEPLAYSCRIPTS_ABSOLUTEPATH} -type d -not -path "*_OLD*" -not -path "*_archive*")
# do
#   if [ "${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}}" != "" ]
#   then
#     mkdir ${SCRIPTS_ABSOLUTEPATH}/${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}/}
#   fi
# done


# >&2 echo "list all the targets..."

# TARGET='all: '

# for i in $(find ${GAMEPLAYSCRIPTS_ABSOLUTEPATH} -type f -name "*.lua" -not -path "*/_OLD/*" -not -path "*/_archive/*" -not -path "*/_*" )
# do
#     FILE=${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}}
#     FULLPATH=${SCRIPTS}${FILE}
#     TARGET="${TARGET} ${FULLPATH}"
# done

# echo ${TARGET}
# echo ''





# >&2 echo "make all the targets..."
# #make all the targets...
# for i in $(find $GAMEPLAYSCRIPTS_ABSOLUTEPATH -type f -name "*.lua" -not -path "*/_OLD/*" -not -path "*/_archive/*" -not -path "*/_*" )
# do
#     FILE=${i##$GAMEPLAYSCRIPTS_ABSOLUTEPATH}

#     echo ${SCRIPTS}${FILE}: ${GAMEPLAYSCRIPTS_ABSOLUTEPATH}${FILE}
#     echo '\tperl ./../bin/removeComments.pl' '<' ${GAMEPLAYSCRIPTS}${FILE} '>' ${SCRIPTS}${FILE}
#     echo ''
# done

# >&2 echo "done..."



















# # GAMEPLAY_SCRIPTS=$1
# # SCRIPTS=$1/../assets/sounds
# # EXE=$2

rm -rf ${SCRIPTS_ABSOLUTEPATH}/*

>&2 echo "make the directories..."
#make the directories.
for i in $(find ${GAMEPLAYSCRIPTS_ABSOLUTEPATH} -type d -not -path "*audacity*" -not -path "*hydrogen*" -not -path "*/_*")
do
	if [ "${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}}" != "" ]
	then
		mkdir ${SCRIPTS_ABSOLUTEPATH}/${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}/}
	fi
done

WAV=wav
OGG=ogg

>&2 echo "list all the targets..."
#list all the targets...
TARGET='all: '

for i in $(find ${GAMEPLAYSCRIPTS_ABSOLUTEPATH} -type f -name "*.wav" -not -path "*/audacity/*" -not -path "*/hydrogen/*" -not -path "*/_*" )
do

  FILE=${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}}
  TO=${SCRIPTS}${FILE}
  FULLPATH=${TO%.${WAV}}.${OGG}

  TARGET="${TARGET} ${FULLPATH}"
done

echo $TARGET
echo ''

>&2 echo "make all the targets..."
#make all the targets...
for i in $(find ${GAMEPLAYSCRIPTS_ABSOLUTEPATH} -type f -name "*.wav" -not -path "*/audacity/*" -not -path "*/hydrogen/*" -not -path "*/_*" )
do
  FILE=${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}}
  TO=${SCRIPTS}${FILE}
  FULLPATH=${TO%.${WAV}}.${OGG}

  echo ${FULLPATH}: ${GAMEPLAYSCRIPTS_ABSOLUTEPATH}${FILE}
  echo '\t./../bin/sox' ${GAMEPLAYSCRIPTS_ABSOLUTEPATH}${FILE} ${FULLPATH}
  echo ''
done
