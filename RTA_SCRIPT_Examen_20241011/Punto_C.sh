#!/bin/bash

LISTA=$1

MI_USUARIO=$(whoami)
MI_HASH=$(sudo cat /etc/shadow | grep $MI_USUARIO | awk -F ':' '{print $2}')

ANT_IFS=$IFS
IFS=$'\n' 

for LINEA in `cat $LISTA | grep -v ^#`
do
	GRUPO=$(echo $LINEA | awk -F ',' '{print $2}')
	USUARIO=$(echo $LINEA | awk -F ',' '{print $1}')
	DIRECTORIO=$(echo $LINEA | awk -F ',' '{print $3}')

	sudo groupadd $GRUPO

	sudo useradd -m -s /bin/bash -G $GRUPO -p $MI_HASH $USUARIO
	

	if [[ $USUARIO = 'p1c2_2024_A1' ]]
	then

		sudo chmod 750 -R $DIRECTORIO
		sudo chown -R $USUARIO:$USUARIO $DIRECTORIO

		sudo su -c "whoami > /Examenes-UTN/alumno_1/validar.txt" $USUARIO
	elif [[ $USUARIO = 'p1c2_2024_A2' ]]
	then

		sudo chmod 760 -R $DIRECTORIO
		sudo chown -R $USUARIO:$USUARIO $DIRECTORIO 

		sudo su -c "whoami > /Examenes-UTN/alumno_2/validar.txt" $USUARIO
	elif [[ $USUARIO = 'p1c2_2024_A3' ]]
	then	

		sudo chmod 700 -R $DIRECTORIO 
		sudo chown -R $USUARIO:$USUARIO $DIRECTORIO

		sudo su -c "whoami > /Examenes-UTN/alumno_3/validar.txt" $USUARIO
	elif [[ $USUARIO = 'p1c2_2024_P1' ]]
	then	

		sudo chmod 775 -R $DIRECTORIO
		sudo chown -R $USUARIO:$USUARIO $DIRECTORIO

		sudo su -c "whoami > /Examenes-UTN/profesores/validar.txt" $USUARIO
	fi	

done

IFS=$ANT_IFS
