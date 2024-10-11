#!/bin/bash 

CARPETA="../RTA_ARCHIVOS_Examen_20241011"
ARCHIVO="Filtro_Avanzado.txt"

sudo touch $ARCHIVO

RUTA_ARCHIVO="${CARPETA}/${ARCHIVO}"

echo "Mi IP publica es: $(curl -s ifconfig.me)" >> $RUTA_ARCHIVO

MI_USUARIO=$(whoami)

echo "Mi usuario es: $MI_USUARIO" >> $RUTA_ARCHIVO 

MI_HASH=$(sudo  cat /etc/shadow | grep $MI_USUARIO | awk -F ':' '{print $2}')

echo "El hash de mi usuario es: $MI_HASH" >> $RUTA_ARCHIVO

MI_REPOSITORIO=$(git remote get-url origin)

echo "La URL de mi repositorio es: $MI_REPOSITORIO" >> $RUTA_ARCHIVO
