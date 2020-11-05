for X in ./input/*
do
  filename=$(basename -- "$X")
  echo $filename
  extension="${filename##*.}"
  transformed="${filename%.*}"
  slug=$(sh ../slugify/slugify.sh -exl "$transformed")
  cp "./input/${filename}" "./output/${slug}.${extension}"
  echo $slug
done