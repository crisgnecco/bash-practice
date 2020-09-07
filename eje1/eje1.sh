#Dado un archivo con una
#lista de palabras
#separadas por saltos de
#líneas, contar la cantidad
#de apariciones de cada
#una e informar por
#pantalla.


if [[ $# -ne 1 ]]
then
      echo "The parameters quantity must be 1"
      exit 1
fi

# it checks if the file exists. 
if ! [ -e $1 ]
then
      echo "The path doesn't exist"
      exit 1
fi

input=$1
cont=0
#The internal field separator (IFS) separates the file and asigns each line to -r variable
while IFS= read -r line; do
  let cont=cont+1 
done < "$input"

echo $cont


