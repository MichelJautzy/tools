#!/bin/bash
#https://www.digitalocean.com/community/tutorials/workflow-resizing-images-with-imagemagick
#Get inputs
read -p 'Bonjour, quelle longueur (exemple : taper 900 pour 900px) ? [900]' width
width=${width:-900}
read -p 'Largeur ? [300]' height
height=${height:-300}
read -p "Quelle Qualite : entre 1 (compression maximale) et 100 (compression minimale)  [quality]?" quality
quality=${quality:-86}
read -p 'Flexible (yes/no) ? [no]' flexible
flexible=${flexible:-no}

#Slugify name of images
sh ./slugify_images.sh
#Prepare output folder
mkdir -p "./output/${width}x${height}"
#Calculate dimensions
if [ "$width" -ge "$height" ]
then
  if [ $flexible == "yes" ]
  then
    dimensions="${width}x${height}>"
    extent_options=""
  else
    dimensions="${width}x${height}^"
    extent_options="-extent ${width}x${height}"
  fi
else
  if [ $flexible == "yes" ]
  then
    dimensions="${width}>x${height}"
    extent_options=""
  else
    dimensions="${width}^x${height}"
    extent_options="-extent ${width}x${height}"
  fi
fi

#Extract jpg
cd output
for X in *.jpg
do
  name_of_output="./${width}x${height}/${width}x${height}-${X}"
  echo $name_of_output
  magick convert "$X" -trim +repage -resize "$dimensions" -gravity center -background transparent $extent_options -quality $quality $name_of_output;
done

#Extract png
for X in *.png
do
  name_of_output="./${width}x${height}/${width}x${height}-${X}"
  echo $name_of_output
  magick convert "$X" -trim +repage -resize "$dimensions" -gravity center -background transparent $extent_options -quality 100 $name_of_output;
done

cd ..
