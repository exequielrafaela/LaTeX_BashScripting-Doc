#!/bin/bash
echo “Contar hasta diez”
for VARIABLE in 1 2 3 4 5 6 7 8 9 10
do
 CONTADOR="Numero $VARIABLE"
 echo $CONTADOR
done

# For example 2
for i in 1 2 3 4 5
do
   echo "Welcome $i times"
done

# For example 3
for i in {1..5}
do
   echo "Welcome $i times"
done

# For example 4
echo "Bash version ${BASH_VERSION}..."
for i in {0..10..2}
  do
     echo "Welcome $i times"
 done

# Hello world using variables
 STR="Hello World!"
 echo $STR