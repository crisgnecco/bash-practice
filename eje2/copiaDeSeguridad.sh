#!/bin/bash

# add & for run it in background mode.(segundo plano)
### $1 fileName $2 TimeBetweenBackups

bash copia.sh $1 $2 &

# >>filename writes a file
echo "-----------------------">>detener
echo "Para detener la ejecucion use el comando">>detener
echo "kill -9 $!">>detener
