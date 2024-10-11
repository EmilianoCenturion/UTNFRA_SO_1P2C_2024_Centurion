#!/bin/bash

CARPETA="../RTA_ARCHIVOS_Examen_20241011"   
ARCHIVO="Filtro_Basico.txt"

sudo touch $ARCHIVO

RUTA_ARCHIVO=$"${CARPETA}/${ARCHIVO}"

echo "Se creo el archivo correctamente"

cat /proc/meminfo | grep "MemTotal" >> $RUTA_ARCHIVO

sudo dmidecode -t chassis | head -n7 | tail -n2 >> $RUTA_ARCHIVO

cat $ARCHIVO
