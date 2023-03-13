#!/bin/bash

###################################################################
#-----------------------------------------------------------------#
# SCRIPT NAME: autocloud.sh                                       #
#-----------------------------------------------------------------#
# DESCRIPTION: This script makes it possible                      #
# to run scripts in Shell Script and one or more commands         #
# for multiple clouds at the same time. Just include in a file    #
# of text the list of clouds, one below the other. Not            #
# no need to include comma.                                       #
# For the scipt to get the text file,                             #
# change the value of the variable FILE to the                    #
# name of the .txt file                                           #
#                                                                 #
# NOTE: Put the text file inside                                  #
# from the same folder as the script                              #
#-----------------------------------------------------------------#
# SITE: https://hagen.dev.br                                      #
#-----------------------------------------------------------------#
# AUTHOR: João Pedro Hagen <joaopedro@hagen.dev.br>               #
#-----------------------------------------------------------------#
# HISTORY:                                                        #
#   V1.0.1 2022-12-11                                             #
#       -Initial release.                                         #
#   V1.0.2 2023-03-13                                             #
#        -Add a new feature for scripts.                          #
#-----------------------------------------------------------------#
###################################################################

echo;
echo;

echo '                       /$$                         /$$                           /$$ ';
echo '                      | $$                        | $$                          | $$ ';
echo '  /$$$$$$  /$$   /$$ /$$$$$$    /$$$$$$   /$$$$$$$| $$  /$$$$$$  /$$   /$$  /$$$$$$$ ';
echo ' |____  $$| $$  | $$|_  $$_/   /$$__  $$ /$$_____/| $$ /$$__  $$| $$  | $$ /$$__  $$ ';
echo '  /$$$$$$$| $$  | $$  | $$    | $$  \ $$| $$      | $$| $$  \ $$| $$  | $$| $$  | $$ ';
echo ' /$$__  $$| $$  | $$  | $$ /$$| $$  | $$| $$      | $$| $$  | $$| $$  | $$| $$  | $$ ';
echo '|  $$$$$$$|  $$$$$$/  |  $$$$/|  $$$$$$/|  $$$$$$$| $$|  $$$$$$/|  $$$$$$/|  $$$$$$$ ';
echo ' \_______/ \______/    \___/   \______/  \_______/|__/ \______/  \______/  \_______/ ';
echo '                                                                                     ';
echo '                                                                                     ';
echo '                                                                                     ';

echo;
echo;

echo "Olá!";
sleep 1;
echo;
echo "Ajudaremos você a executar comandos e scripts em servidores em lote.";
sleep 2;
echo;
echo "Basta criar um arquivo .txt e adicioná-lo ao mesmo diretório do script.";
sleep 2;
echo;
echo "Em seguida, altere o valor da variável ARCHIVE para o nome do seu arquivo .txt.";
sleep 2;
echo;
echo "Vamos começar? =D" ;


sleep 2;

echo;
echo;

ARCHIVE=clouds.txt

#Get the list of clouds from the clouds.txt file
CLOUDLIST=$(cat "$ARCHIVE" | grep ^ip)

begin () {
    read -p 'É um comando ou script? [1]-Comando  [2]-Script:  ' CHOICE; 
}

response () {

    if [ "$CHOICE" -eq 1 ]; then

        #Request the command you want to run.
        read -p 'Digite os comandos separados por (;): ' COMANDO;

        #Loop to perform access with the echo that prints what is running.
        for CLOUDACCESS in $CLOUDLIST;
        do

            ssh root@"$CLOUDACCESS" "$COMANDO";
            echo "$CLOUDACCESS" "$COMANDO";

        done

    elif [ "$CHOICE" -eq 2 ]; then

        #Request the script you want to run.
        read -p 'Digite o caminho absoluto do script: ' SCRIPT;

        #Loop to perform access with the echo that prints what is running.
        for CLOUDACCESS in $CLOUDLIST;
        do

            ssh root@"$CLOUDACCESS" rm -rf /autocloud/\*;
            ssh root@"$CLOUDACCESS" mkdir -p /autocloud;
            scp "$SCRIPT" root@"$CLOUDACCESS":/autocloud/;
            ssh root@"$CLOUDACCESS" chmod +x /autocloud/\*.sh;
            ssh root@"$CLOUDACCESS" /autocloud/./\*.sh;
            ssh root@"$CLOUDACCESS" rm -rf /autocloud/\*;
            echo; 
            echo "$CLOUDACCESS" "$SCRIPT";
            echo;
            echo;
        done

    else
        echo "Resposta inválida!";
        echo;
        echo;
        begin;
        response;
    fi
}

begin;
response;

sleep 3;

echo;
echo;
echo " ____   ___  ____  __  ____  ____                                    ";
echo "/ ___) / __)(  _ \(  )(  _ \(_  _)                                   ";
echo "\___ \( (__  )   / )(  ) __/  )(                                     ";
echo "(____/ \___)(__\_)(__)(__)   (__)                                    ";
echo " ____  _  _  _    _  _   __    ___  ____  __ _     ____  ____  _  _  ";
echo "(  _ \( \/ )(_)  / )( \ / _\  / __)(  __)(  ( \   (    \(  __)/ )( \ ";
echo " ) _ ( )  /  _   ) __ (/    \( (_ \ ) _) /    / _  ) D ( ) _) \ \/ / ";
echo "(____/(__/  (_)  \_)(_/\_/\_/ \___/(____)\_)__)(_)(____/(____) \__/  ";

sleep 5; 

exit 0;
