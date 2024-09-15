#!/bin/sh

source ./../menu.sh

while :
do
	menu
    if [ $choix_menu -gt 4 ];
    then
        echo "TEST RATE choix_menu = $choix_menu";
        exit
    elif [ $choix_menu -lt 1 ];
    then
        echo "TEST RATE choix_menu = $choix_menu";
        exit
    fi

     # Fonction menu permets au joueur de choisir entre quitter, jouer, aller aux credits, aller au instructions
	if [ $choix_menu -eq 1 ];
	then
		echo "choix jouer choisi"
	elif [ $choix_menu -eq 2 ];
	then
		echo "choix instructions choisi"
	elif [ $choix_menu -eq 3 ];
	then
		echo "choix credits choisi"
	elif [ $choix_menu -eq 4 ];
	then
		echo "choix quitter choisi"
	fi
done
