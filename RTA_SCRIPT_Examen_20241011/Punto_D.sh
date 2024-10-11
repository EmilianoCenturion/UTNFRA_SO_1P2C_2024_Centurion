#!/bin/bash

mkdir -p $HOME/Estructura_Asimetrica/{{correo,cliente}/cartas_{1..100},correo/carteros_{1..10}}


tree $HOME/Estructura_Asimetrica/ --noreport | pr -T -s'' -w 80 --column 4 
