#!/bin/bash

. ./menu.sh
. ./jouer.sh
. ./stat.sh
menu

choix=$?

while [ $choix -ne 5 ]
do
    if [ $choix -eq 1 ]
    then
        jeux
    fi
    if [ $choix -eq 2 ]
    then
        clear
        echo "Appuyer sur Q pour faire aller la barre à gauche, et sur D pour faire aller la barre à droite
Vous controlez la barre du bas, l'objectif est de ne pas laisser la balle dépasser votre barre
        
Appuyer sur entrée pour retourner au menu"
        read -s -n 1 key
        while [[ $key != "" ]]; do 
            read -s -n 1 key
        done

    fi
    if [ $choix -eq 3 ]
    then
        clear
        echo "Paul Nassiri
Kylian Leroy
Hugo Crepin
        
Appuyer sur entrée pour retourner au menu"
        read -s -n 1 key
        while [[ $key != "" ]]; do 
            read -s -n 1 key
        done
    fi
    if [ $choix -eq 4 ]
    then
        statistiques
    fi
    menu
    choix=$?
done
clear