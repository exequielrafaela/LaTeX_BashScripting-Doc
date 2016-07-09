#!/bin/bash

#Crear un script que al ser ejecutado solicite por línea de comando que dato de configuración
#de red desea obtener el usuario. Si el usuario ingresa el valor 'ip', entonces devolverá por
#STDOUT la direcciones IPs del host. Si el usuario ingresa el valor 'mask', entonces el script
#devolverá por STDOUT máscaras de subred del host. Cualquier otro valor ingrese se
#considerará error y deberá salir con estado 1.
#Ayuda: Utilizar comandos read, ifconfig, grep, if, test, cut o sed, exit

read -p "Ingrese parametro de conf de Red desea: " Param_red

#Dir_name=$(echo "$Dir" | tr '/' '-')
#curso@ubuntu:~/tema10$ ls -lR /home/curso/ | grep '^d' | cut -d' '  -f9-13 | cut -d':' -f2
#ls -ld $Dir* | cut -d' ' -f12-16 | cut -d'/' -f2-6 | sed '/^$/d' > Dir_list.txt

Ip_addr=$(ifconfig | grep Bcast | cut -d' ' -f12 | cut -d':' -f2)
Ip_masc=$(ifconfig | grep Bcast | cut -d' ' -f16 | cut -d':' -f2)

if [ $Param_red == "ip" ]
then
	echo "The IP Address is: $Ip_addr"
	elif [ $Param_red == "mask" ]
		then
    	echo "The Subnet Mask is: $Ip_masc"	
else
	echo "ERROR"
	exit 1
fi

########### OUTPUT ##############

#curso@ubuntu:~/ParcialII$ ./ejercicio3.sh 
#Ingrese parametro de conf de Red desea: ip
#The IP Address is: 10.0.2.15
#curso@ubuntu:~/ParcialII$ ./ejercicio3.sh 
#Ingrese parametro de conf de Red desea: mask
#The Subnet Masc is: 255.255.255.0
#curso@ubuntu:~/ParcialII$ ./ejercicio3.sh 
#Ingrese parametro de conf de Red desea: Brod
#ERROR


