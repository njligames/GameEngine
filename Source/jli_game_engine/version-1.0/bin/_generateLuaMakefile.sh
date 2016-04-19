GAMEPLAYSCRIPTS_ABSOLUTEPATH=${1}

# _GAMEPLAYSCRIPTS=./
_SCRIPTS=/../assets/scripts

SCRIPTS_ABSOLUTEPATH=${GAMEPLAYSCRIPTS_ABSOLUTEPATH}${_SCRIPTS}

GAMEPLAYSCRIPTS=.
SCRIPTS=${GAMEPLAYSCRIPTS}/../assets/scripts

rm -rf ${SCRIPTS_ABSOLUTEPATH}/*

>&2 echo "make the directories..."
for i in $(find ${GAMEPLAYSCRIPTS_ABSOLUTEPATH} -type d -not -path "*_OLD*" -not -path "*_archive*")
do
  if [ "${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}}" != "" ]
  then
    mkdir ${SCRIPTS_ABSOLUTEPATH}/${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}/}
  fi
done


>&2 echo "list all the targets..."

TARGET='all: '

for i in $(find ${GAMEPLAYSCRIPTS_ABSOLUTEPATH} -type f -name "*.lua" -not -path "*/_OLD/*" -not -path "*/_archive/*" -not -path "*/_*" )
do
    FILE=${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}}
    FULLPATH=${SCRIPTS}${FILE}
    TARGET="${TARGET} ${FULLPATH}"
done

echo ${TARGET}
echo ''





>&2 echo "make all the targets..."
#make all the targets...
for i in $(find $GAMEPLAYSCRIPTS_ABSOLUTEPATH -type f -name "*.lua" -not -path "*/_OLD/*" -not -path "*/_archive/*" -not -path "*/_*" )
do
    FILE=${i##$GAMEPLAYSCRIPTS_ABSOLUTEPATH}

    echo ${SCRIPTS}${FILE}: ${GAMEPLAYSCRIPTS_ABSOLUTEPATH}${FILE}
    echo '\tperl ./../bin/removeComments.pl' '<' ${GAMEPLAYSCRIPTS}${FILE} '>' ${SCRIPTS}${FILE}
    echo ''
done

>&2 echo "done..."


