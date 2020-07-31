fileName=$1
while true ;do

  #Test:If 6 is greater than 5, output yes, otherwise output no.
  
  fecha=`date +%d%m%Y`
  hora=`date +%H%M%S`
  
  #if [ -d $fileName ] 
  if test -d $path 
  then
    newPath=${fileName##*/}
    newFileName="$newPath$fecha$hora"
    cp -r $newPath $newFileName
  fi
  sleep $2
done