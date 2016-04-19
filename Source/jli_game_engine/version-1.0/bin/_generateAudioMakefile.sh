GAMEPLAY_SCRIPTS=$1
SCRIPTS=$1/../assets/sounds
EXE=$2

rm -rf ${SCRIPTS}/*

#make the directories.
for i in $(find ${GAMEPLAY_SCRIPTS} -type d -not -path "*audacity*" -not -path "*hydrogen*" -not -path "*/_*")
do
	if [ "${i##${GAMEPLAY_SCRIPTS}}" != "" ]
	then
		mkdir ${SCRIPTS}/${i##${GAMEPLAY_SCRIPTS}/}
	fi
done

WAV=wav
OGG=ogg

#list all the targets...
TARGET='all: '

for i in $(find ${GAMEPLAY_SCRIPTS} -type f -name "*.wav" -not -path "*/audacity/*" -not -path "*/hydrogen/*" -not -path "*/_*" )
do

    FILE=${i##${GAMEPLAY_SCRIPTS}}
	TO=${SCRIPTS}${FILE}
	FULLPATH=${TO%.${WAV}}.${OGG}

    TARGET="${TARGET} ${FULLPATH}"
done

echo $TARGET
echo ''


#make all the targets...
for i in $(find ${GAMEPLAY_SCRIPTS} -type f -name "*.wav" -not -path "*/audacity/*" -not -path "*/hydrogen/*" -not -path "*/_*" )
do
    FILE=${i##${GAMEPLAY_SCRIPTS}}
	TO=${SCRIPTS}${FILE}
	FULLPATH=${TO%.${WAV}}.${OGG}

    echo ${FULLPATH}: ${GAMEPLAY_SCRIPTS}${FILE}
	echo '\t'${EXE} ${GAMEPLAY_SCRIPTS}${FILE} ${FULLPATH}
    echo ''
done
