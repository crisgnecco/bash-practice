#! /bin/bash

################################################################################
# Help                                                                         #
################################################################################

Help()
{
   echo "Determinar la existencia de archivos duplicados en el File System y
         también cuáles archivos superan en tamaño un umbral determinado"
   echo
   echo "opciones:"
   echo
   echo "d     “directorio”: path absoluto o relativo a analizar. Requerido."
   echo "o     “directorio resultado”: path absoluto o relativo del directorio donde se generará el archivo
            de salida. Opcional. Si no se informa se generará en el directorio de ejecución."
   echo "u     “umbral”: tamaño definido en KB para definir el umbral a analizar. Opcional. Si no es
        indicado, se considerará como umbral el promedio de peso de los archivos inspeccionados."
   echo "h     imprime ayuda"
}


### Lectura de Argumentos                                                                                       
while getopts "d:o:u:h:-help" opcion
do
    case $opcion in
        d) pathEntrada=$OPTARG;;
        o) pathResultado=$OPTARG;;
        u) umbralUsuario=$OPTARG;;
	h | -help) Help;;
        *)
            Help;;
    esac
done


################################################################################
# Validaciones y tratamiento de argumentos                                                                        #
################################################################################

### Validacion de pathEntrada
if [ "$pathEntrada" ]
then
    ### Validar que sea un direcrorio valido y que tenga permisos de lectura
    if ! [  -r "$pathEntrada" -o -e "$pathEntrada"  ] 
    then
        echo "Error: La ruta a analizar ingresada es incorrecta/no tiene permisos de lectura/escritura. Escribir 'ejercicio3.sh -h' para obtener informacion"
        exit 1
    fi
else
    echo "Error: Se debe ingresar la ruta absoluta o relativa a analizar. Escribir 'ejercicio3.sh -h' para obtener informacion"
    exit 1
fi
    
###########################################################

fecha=$( date +'%Y-%m-%d_%H:%M:%S' )
nombreArchSalida="resultado_$fecha.out"
### Validacion de Arg opcional 
if ! [ "$pathResultado" ]
then

    pathResultado="${pathEntrada}${nombreArchSalida}"                                                   
else    
    
    ### Validar que sea un directorio valido 
    
    if ! [ -e "$pathResultado"  ] 
    then
       echo "Error: La ruta de destino ingresada es incorrecta/no tiene permisos de lectura, Escribir 'ejercicio3.sh -h' para obtener informacion"
        exit 1
    fi
    
    pathResultado="${pathResultado}${nombreArchSalida}"
    
fi
    
###########################################################

#umUser=2 #2KB
kilo=1024

### calcular el promedio de pesos de archivos, este sera el umbral por defecto.

IFS=$'\n' 
calcPromedioTam() {
    acumTamArchs=0
    cantArchs=0

    for d in `find "$pathEntrada" -type f` 
    do 
        filesize=$(stat -c%s "$d")  
        acumTamArchs=$((acumTamArchs+filesize)) 
        cantArchs=$((cantArchs+1))  
        #echo "el tam es: $filesize"
    done
    
    promedioDetam=$((acumTamArchs/cantArchs)) #para calculos artmeticos.
}
        
calcPromedioTam


### Validacion de Arg opcional, si no esta, si usa el promedio de pesos como umbral.
if [ $umbralUsuario ]
then
    cero=0
    if [ $umbralUsuario -lt $cero ]; then
        echo "Error: Se debe ingresar un umbral mayor a 0. Escribir 'ejercicio3.sh -h' para obtener informacion"
        exit 1 
    fi
    
    umbral=$(($umbralUsuario * $kilo)) # expresado en Bytes
else 
    umbral=$promedioDetam # expresado en Bytes
fi


################################################################################
# Main                                                                        #
################################################################################

IFS=$'\n' 
for path in `find "$pathEntrada" -type f`; do # TODO: aca voy a tener que cambiar para que no tome

    ### reviso el tamaño de archivos
    filesize=$(stat -c%s "$path") 

    ### Obtendo el name
    fileName=${path##*/}
    
    if ! [ $filesize -lt $umbral ]; then # tam > umbral, no cumple

         ### agrego a lista para luego ordenar y grabar
         archsSuperanUmbralArray+=("$path $filesize") # TODO: revisar para archs con path largo!!

    fi

    #################################
    
    ### Buscar duplicados
    

    duplicados=$(find "$pathEntrada" -name $fileName -type f) 

    ### cuento las lineas
    
    cant=0
    for du in $duplicados
    do
        cant=$((cant+1)) 
    done

    #####################
    
    #### Quiero ver si no esta en la lista.
    
    noSeBuscoDuplicados=0
    for elem in "${archsYaProcesadosArray[@]}"
    do 
        if [ "$elem" = "$fileName" ]; then
            noSeBuscoDuplicados=1
        fi
    done

    #####################
    
    if [ $cant -gt 1 -a $noSeBuscoDuplicados -eq 0 ] # si es > 1, hay duplicados ### && no esta en la lista de arch con dup.
        then
            ### Grabo nombre
            
            echo >> "$pathResultado"
            echo "nombreArchivo: $fileName" >> "$pathResultado"

            ### Recorro dup y obtengo, tener en cuenta que dup puede tener varias lineas.
            
            for dupli in $duplicados
            do
                #ubicacion de cada dup                
                echo "Ubicacion: $dupli" >> "$pathResultado"
                
                #fecha de modificacion de cada dups
                fecha=$(date -r $dupli "+%m-%d-%Y") 
                echo "Fecha de ultima modificacion: $fecha" >> "$pathResultado"

            done

        ### guardo en lista de arch con duplicados.
            archsYaProcesadosArray+=($fileName)
    fi
done

### Grabo el arch de supera umbral en arch temporal

pathSuperanUmbralTemp=${pathEntrada}"superanUmbralTemp.txt" 

for arch in "${archsSuperanUmbralArray[@]}"
do 
    echo $arch >> "$pathSuperanUmbralTemp"
done

### Ordeno descendente por tamaño.

echo >> "$pathResultado" # salto de linea en arch

if [ -e "$pathSuperanUmbralTemp" ] # si es dir valido
then
    sort -nr -nk2 "$pathSuperanUmbralTemp" >> "$pathResultado" 

    ### borrar el archivo que estaba desordenado
    rm $pathSuperanUmbralTemp # TODO: ver si se puede sacar esto!
fi

### Muestro el archivo generado en la consola.
cat "$pathResultado"


