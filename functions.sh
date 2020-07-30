
# functions practice
validarAperturaArch(){
  if ! [ -e $1 ]
  then
      echo "The path doesn't exist"
      exit 1
  fi
}

validarAperturaArch archInexistente.txt