#!/bin/bash
ErrorS()
{
 echo "Error. La sintaxis del script es la siguiente:"
 echo "para contar la cant de lineas del arch: $0 nombre_archivo L" # COMPLETAR
 echo "para contar la cant de car del arch: $0 nombre_archivo C" # COMPLETAR
 echo "para contar la cant de car de la linea mas larga: $0 nombre_archivo M" # COMPLETAR
} 

ErrorP()
{
 echo "Error. nombre_archivo no tiene permisos de lectura" # COMPLETAR
} 

#codigo                                                                                                                                               
if test $# -lt 2; then
        ErrorS
fi
if ! test -r $1; then
        ErrorP
#elif test -f $1 -a \( test $2 -eq "L" -o test $2 -eq "C" -o test $2 -eq "M" \); then                                                                 
elif [ -f $1 -a \( $2 = "L" -o $2 = "C" -o $2 = "M" \) ]; then
        if [ $2 = "L" ]; then
                res=`wc -l $1`
                echo "Cantidad de lineas: $res"
        elif [ $2 = "C" ]; then
                res=`wc -m $1`
                echo "Cantidad de caracteres: $res"
        elif [ $2 = "M" ]; then
                res=`wc -L $1`
                echo "Cantidad maxima de caracteres en una linea: $res"
        fi
else
        ErrorS
fi