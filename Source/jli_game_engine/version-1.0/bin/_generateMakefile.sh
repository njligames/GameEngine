#WORKING_DIRECTORY=/Users/jamesfolk/NJLI/GameEngine/COMMON
WORKING_DIRECTORY=$1

## declare an array variable
declare -a arr=("gameplay_scripts" "audio" )

echo 'all: '
## now loop through the above array
for i in "${arr[@]}"
do
   echo '\tcd '${WORKING_DIRECTORY}/${i}' && make'
done
# You can access them using echo "${arr[0]}", "${arr[1]}" also

