#!/bin/bash

# falta validacion de parametros
pri=$1
seg=$2

if test $pri -lt $seg
then
    echo "el primero es menor"
else
    echo "el segundo es menor"
fi