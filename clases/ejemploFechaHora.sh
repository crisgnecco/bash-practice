#!/bin/bash

date # imprime fecha y hora del sist

# $(comando) reeem la comilla francesa # no funciono aun

#fecha=$(date | cut -d " " -f 1,2,3) #-f es field, -d indica el separador.

fecha=`date | cut -d " " -f 1,2,3` #-f es field, -d indica el separador
hora=`date | cut -d " " -f 4,5,6` 
echo $fecha
echo $hora

#touch ejemplo.sh // crea archivo o cambia de nombre
#clear // limpia pantalla
# file // te dice tipo de archivo
# man // tira la ayuda de un comando