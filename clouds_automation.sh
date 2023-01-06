#!/bin/bash

###################################################################
#-----------------------------------------------------------------#
# Nome do Script: cloud_automation.sh                             #
#-----------------------------------------------------------------#
# Descrição: Esse script possibilita rodar um ou mais comandos    #
# para vários clouds ao mesmo tempo. Basta incluir em um arquivo  #
# de texto a listagem dos clouds, um abaixo do outro. Não         #
# há necessidade de incluir vírgula.                              #
# Para o scipt pegar o arquivo de texto,                          # 
# troque o valor da varíavel ARQUIVO para o nome do arquito .txt  #
#                                                                 #
# Obs.: Cloque o arquivo de texto dentro                          #
# da mesma pasta do script                                        #
#-----------------------------------------------------------------#
# Site: https://hagen.dev.br                                      #
#-----------------------------------------------------------------#
# Autor: João Pedro Hagen <joaopedro@hagen.dev.br>                #
#-----------------------------------------------------------------#
# Histórico:                                                      #
#   V1.0.1 2022-12-11                                             #
#       -Initial release.                                         #
#-----------------------------------------------------------------#
###################################################################


ARQUIVO=clouds.txt

#Pega a lista de clouds do arquivo clouds.txt
CLOUDLIST=$(cat "$ARQUIVO" | grep ^ip)

#Solicita o comando ou script que vai querer rodar. (A parte do script ainda vou testar.)
read -p 'Digite os comandos separados por (;): ' COMANDO;

#Loop para realizar o acesso com o echo que printa o que está rodando.
for CLOUDACCESS in $CLOUDLIST;
do

    ssh root@"$CLOUDACCESS" "$COMANDO";
    echo "$CLOUDACCESS" "$COMANDO"

done

