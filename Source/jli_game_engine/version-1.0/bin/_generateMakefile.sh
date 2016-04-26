#WORKING_DIRECTORY=/Users/jamesfolk/NJLI/GameEngine/COMMON
WORKING_DIRECTORY=$1

## declare an array variable
declare -a arr=("countryLevel" "gameplay" "interface" "gameplay_scripts" "audio" )

echo 'all: '

echo '\tmkdir -p '${WORKING_DIRECTORY}/assets
echo '\tmkdir -p '${WORKING_DIRECTORY}/assets/cameras
echo '\tmkdir -p '${WORKING_DIRECTORY}/assets/curves
echo '\tmkdir -p '${WORKING_DIRECTORY}/assets/fonts
echo '\tmkdir -p '${WORKING_DIRECTORY}/assets/images
echo '\tmkdir -p '${WORKING_DIRECTORY}/assets/materials
echo '\tmkdir -p '${WORKING_DIRECTORY}/assets/meshes
echo '\tmkdir -p '${WORKING_DIRECTORY}/assets/particles
echo '\tmkdir -p '${WORKING_DIRECTORY}/assets/scripts
echo '\tmkdir -p '${WORKING_DIRECTORY}/assets/shaders
echo '\tmkdir -p '${WORKING_DIRECTORY}/assets/sounds
echo '\tmkdir -p '${WORKING_DIRECTORY}/assets/strings

## now loop through the above array
for i in "${arr[@]}"
do
   echo '\tcd '${WORKING_DIRECTORY}/${i}' && make'
done


echo ''
echo 'clean: '
echo '\tcd ./countryLevel && make clean'
echo '\trm -rf '${WORKING_DIRECTORY}/assets/cameras
echo '\trm -rf '${WORKING_DIRECTORY}/assets/curves
#echo '\trm -rf '${WORKING_DIRECTORY}/assets/fonts
echo '\trm -rf '${WORKING_DIRECTORY}/assets/images
echo '\trm -rf '${WORKING_DIRECTORY}/assets/materials
echo '\trm -rf '${WORKING_DIRECTORY}/assets/meshes
#echo '\trm -rf '${WORKING_DIRECTORY}/assets/particles
echo '\trm -rf '${WORKING_DIRECTORY}/assets/scripts
#echo '\trm -rf '${WORKING_DIRECTORY}/assets/shaders
echo '\trm -rf '${WORKING_DIRECTORY}/assets/sounds
#echo '\trm -rf '${WORKING_DIRECTORY}/assets/strings

