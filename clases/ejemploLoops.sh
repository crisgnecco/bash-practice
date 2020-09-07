
# $PATH: variable de entorno de path
# env: muestra todas las variables de entorno actuales

IFS=":" #cambio el separador de campos de /n a :

for item in $PATH; do
    echo "$item"
done
