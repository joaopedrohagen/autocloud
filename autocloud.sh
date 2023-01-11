#!/bin/bash

###################################################################
#-----------------------------------------------------------------#
# SCRIPT NAME: autocloud.sh                                       #
#-----------------------------------------------------------------#
# DESCRIPTION: This script makes it possible                      #
# to run one or more commands                                     #
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

echo "Hi!";
sleep 1;
echo;
echo "We will help you to run commands and scripts in batch clouds.";
sleep 2;
echo;
echo "Just create a .txt file and add it to the same directory as the script.";
sleep 2;
echo;
echo "Then, change the value of the ARCHIVE variable to the name of your .txt file.";
sleep 2;
echo;
echo "Let's start? =D" ;


sleep 2;

echo;
echo;

ARCHIVE=clouds.txt

#Get the list of clouds from the clouds.txt file
CLOUDLIST=$(cat "$ARCHIVE" | grep ^ip)

# Request the command or script you want to run. (The script part I'm still testing.)
read -p 'Digite os comandos separados por (;): ' COMANDO;

#Loop to perform access with the echo that prints what is running.
for CLOUDACCESS in $CLOUDLIST;
do

    ssh root@"$CLOUDACCESS" "$COMANDO";
    echo "$CLOUDACCESS" "$COMANDO";

done

sleep 3;

echo
echo
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
