#!/bin/bash

DISCO=$(sudo fdisk -l | grep '10 GiB' | awk '{print $2}' | awk -F ':' '{print $1}')

echo "Particionando disco = $DISCO"
echo

sudo fdisk $DISCO << EOF
n
e
1


n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M

w
EOF

echo 
echo "Particiones creadas"

sudo fdisk -l $DISCO

echo "Formateando las particiones"

for i in {5..14}
do
	DISCO_ACTUAL=${DISCO}${i}
	sudo mkfs.ext4 -F ${DISCO_ACTUAL}
done

echo "Montando las particiones"

INDICE=5

for carpeta in alumno_1/parcial_1 alumno_1/parcial_2 alumno_1/parcial_3 alumno_2/parcial_1 alumno_2/parcial_2 alumno_2/parcial_3 alumno_3/parcial_1 alumno_3/parcial_2 alumno_3/parcial_3 profesores
do
	DISCO_A_MONTAR=${DISCO}${INDICE}
	DIRECTORIO="/Examenes-UTN/${carpeta}"
	
	#          <dispositivo>         <dir>        <tipo>    <opciones>    <dump>    <fsck>
	echo    "${DISCO_A_MONTAR}   ${DIRECTORIO}     ext4      defaults       0         0" | sudo tee -a /etc/fstab 
	
	INDICE=$((INDICE+1))
done


sudo systemctl daemon-reload
sudo mount -a
