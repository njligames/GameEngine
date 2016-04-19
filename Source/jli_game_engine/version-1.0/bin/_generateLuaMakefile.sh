GAMEPLAYSCRIPTS_ABSOLUTEPATH=${1}

_SCRIPTS=/../assets/scripts

SCRIPTS_ABSOLUTEPATH=${GAMEPLAYSCRIPTS_ABSOLUTEPATH}${_SCRIPTS}

GAMEPLAYSCRIPTS=.
SCRIPTS=${GAMEPLAYSCRIPTS}/../assets/scripts

rm -rf ${SCRIPTS_ABSOLUTEPATH}/*

TARGET='all: '

>&2 echo "accumulate the directory targets..."
for i in $(find ${GAMEPLAYSCRIPTS_ABSOLUTEPATH} -type d -not -path "*_OLD*" -not -path "*_archive*")
do
  if [ "${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}}" != "" ]
  then
    TARGET="${TARGET} ${SCRIPTS_ABSOLUTEPATH}/${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}/}"
  fi
done


>&2 echo "accumulate the file targets..."
for i in $(find ${GAMEPLAYSCRIPTS_ABSOLUTEPATH} -type f -name "*.lua" -not -path "*/_OLD/*" -not -path "*/_archive/*" -not -path "*/_*" )
do
    FILE=${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}}
    FULLPATH=${SCRIPTS}${FILE}
    TARGET="${TARGET} ${FULLPATH}"
done

echo ${TARGET}
echo ''





>&2 echo "list the file targets..."
for i in $(find $GAMEPLAYSCRIPTS_ABSOLUTEPATH -type f -name "*.lua" -not -path "*/_OLD/*" -not -path "*/_archive/*" -not -path "*/_*" )
do
  FILE=${i##$GAMEPLAYSCRIPTS_ABSOLUTEPATH}

  echo ${SCRIPTS}${FILE}: ${GAMEPLAYSCRIPTS}${FILE}
  echo '\tperl ./../bin/removeComments.pl' '<' ${GAMEPLAYSCRIPTS}${FILE} '>' ${SCRIPTS}${FILE}
  echo ''
done

>&2 echo "list the directory targets..."
for i in $(find ${GAMEPLAYSCRIPTS_ABSOLUTEPATH} -type d -not -path "*_OLD*" -not -path "*_archive*")
do
  if [ "${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}}" != "" ]
  then
    echo ${SCRIPTS_ABSOLUTEPATH}/${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}/}:
    echo '\tmkdir -p ' ${SCRIPTS_ABSOLUTEPATH}/${i##${GAMEPLAYSCRIPTS_ABSOLUTEPATH}/}
    echo ''
  fi
done

>&2 echo "done..."
