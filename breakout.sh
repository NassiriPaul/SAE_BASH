#!/bin/bash


. menu.sh

intro # Fonction intro présente le jeu et comment y jouer ou on peut aller a la page suivant

while :
do
	menu # Fonction menu permets au joueur de choisir entre quitter, jouer, aller aux credits, aller au instructions
	if [choix_menu == 1]
	then
		jouer
	elif [choix_menu == 2]
	then
		instructions
	elif [choix_menu == 3]
	then
		credits
	elif [choix_menu == 4]
	then
		exit
	fi
done
