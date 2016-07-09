#!/bin/bash

#Cree un script que se ejecute una vez al día a las 4.00hs que realice la sigu
#iente acción:
#1.- Para todos los archivos de su directorio /home/usuario, si existen más de 4
#archivos/directorios con fecha de modificación en octubre, noviembre o diciembre, entonces
#crear un archivo tar.gz del directorio completo y guardarlo en el directorio /tmp/salida.tar.gz.
#Importante: Adjuntar en la entrega la línea de crontab utilizada y el script.

#curso@ubuntu:~/ParcialII$ crontab -e

#MAILTO=exequielrafaela@gmail.com

##########################################################
#minuto (0-59),                                          #
#|  hora (0-23),                                         #
#|  |  día del mes (1-31),                               #
#|  |  |  mes (1-12),                                    #
#|  |  |  |  día de la semana (0-6 donde 0=Domingo)      #
#|  |  |  |  |       comandos                            #
##########################################################

#0 4 * * * /home/curso/ParcialII/ejercicio2.sh | mail -s "ejercicio2" exequielrafaela@gmail.com

#OCURRENCIAS=$(ls -la /home/curso | grep -c Oct)
#OCURRENCIAS=$(ls -la /home/curso | grep -c Nov)
#OCURRENCIAS=$(ls -la /home/curso | grep -c Dic)
OCURRENCIAS=$(ls -la /home/curso | egrep -i -c 'Oct|Nov|Dic')

if [ "$OCURRENCIAS" -gt 4 ] 
then
        echo "existen más de 4 archivos/directorios con fecha"
        echo  "de modificación en octubre, noviembre o diciembre"
        tar -zcvf /tmp/saliad.tar.gz /home/curso
else
        echo "No se cumple la condición planteada de modificación archivos"
fi


###########

# OUTPUT - Se realiza ejemplo para dir /home/curso/ParcialIIcurso@ubuntu:~/ParcialII$ ./ejercicio2.sh 

#curso@ubuntu:~/ParcialII$ ./ejercicio2.sh 
#existen más de 4 archivos/directorios con fecha
#de modificación en octubre, noviembre o diciembre
#tar: Removing leading `/' from member names
#/home/curso/ParcialII/
#/home/curso/ParcialII/ejercicio1.sh
#home/curso/ParcialII/ejercicio2.sh
#curso@ubuntu:~/ParcialII$ ls /tmp/
#config-err-epPb49  orbit-curso  saliad.tar.gz

