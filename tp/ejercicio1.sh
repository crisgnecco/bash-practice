#!/bin/bash
ErrorS()
{
 echo "Error. La sintaxis del script es la siguiente:"
 echo "......................: $0 nombre_archivo L" # COMPLETAR
 echo "......................: $0 nombre_archivo C" # COMPLETAR
 echo "......................: $0 nombre_archivo M" # COMPLETAR
} 

ErrorP()
{
 echo "Error. nombre_archivo ....................." # COMPLETAR
} 

if test $# -lt 2; then
 ErrorS
fi 

### seguir pegando el codigo.