
awk '{ 
        sub(/^[a-z]/, toupper(substr($1,1,1)),$1); print $1 
     }' < $1 #arch en el q se quiere contar rep 


# /^[a-z]/ marca el primer caracter en minuscula
# tener en cuenta que esto modifica la variable local $1 y la muestra, no se modifica el arch