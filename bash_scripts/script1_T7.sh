#!/bin/bash

#Cree un script llamado script1_T7.sh que sea interpretado por bash. Al
#ejecutarse debe buscar en el directorio HOME/CURSO todos los archivos y
#ordenelos por nombres alfabéticamente. Redireccione el contenido en un ar-
#chivo llamado salida_script1_T7.txt. Ayuda: Puede emplear la opción -R del
#Comando ls para listar subdirectorios, y la opción -u del comando sort.

ls -R /home/curso | sort -u > salida_script1_T7.txt