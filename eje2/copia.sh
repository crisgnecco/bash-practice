ruta=$1
while true ;do

  #Test:If 6 is greater than 5, output yes, otherwise output no.
  
  fecha=`date +%d%m%Y`
  hora=`date +%H%M%S`
  
  #if [ -d $fileName ] 
  if test -d $ruta                      # que verifica esto????
  then
    newPath=${ruta##*/}
    echo newPath
    newFileName="$newPath$fecha$hora"
    cp -r $newPath $newFileName
  else                                  # para que sirve esta parte???
    newFileName="$ruta$fecha$hora"
    cp -r $ruta $newFileName
  fi
  sleep $2
done