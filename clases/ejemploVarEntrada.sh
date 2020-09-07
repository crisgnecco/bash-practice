#!/bin/bash

name () {
    echo "nombre del archivo: $0 nombre propietario: $1"
    var=10 # las variables son globales
}

var=20
echo $var

#name Cristian Gnecco