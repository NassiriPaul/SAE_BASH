#!/bin/bash
. ./variables.sh
. ./menu.sh
nb_parties=0;
victoireJ=0;
scoreJ=0;
scoreB=0;
res=0

function parcours_histo {
    if [ -e "./historique.txt" ] 
    then
    while IFS='\n' read -r line; do
        if [ "${line:0:1}" = 'S' ]
        then
            res=$(echo "$line" | cut -d" " -f4)
            if [ "${line:6:1}" = 'J' ]
            then
                nb_parties=$[ $nb_parties + 1 ]   
                if [ $res -ge $score_victoire ]
                then
                    victoireJ=$[ $victoireJ + 1 ]
                fi
                scoreJ=$[ $scoreJ + $res ]
            else
                scoreB=$[ $scoreB + $res ]
            fi
        fi
    done < "./historique.txt" ;
    else
    echo "Pas encore d'historique"
    sleep 2
    menu
    fi
}

function affiche_histo {
    echo "Nombre de parties = $nb_parties"
    echo "Nombre de parties gagnées = $victoireJ"
    echo -n "Taux de victoire = "
    printf %.3f "$((1000 *   $[ $victoireJ  * 100 ]/$nb_parties  ))e-3"; echo "%"
    echo -n "Score total du Joueur = $scoreJ
Score moyen du Joueur = "
    printf %.2f\\n "$((100 *   $scoreJ/$nb_parties  ))e-2"
    echo "
Appuyer sur entrée pour retourner au menu"
    read -s -n 1 key
    while [[ $key != "" ]]; do 
    read -s -n 1 key
    done
}

function statistiques {
    clear
    parcours_histo
    affiche_histo
}
