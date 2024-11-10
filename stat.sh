#!/bin/bash
. ./variables.sh
nb_parties=0;
victoireJ=0;
scoreJ=0;
scoreB=0;
res=0

function parcours_histo {
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
}

function affiche_histo {
    echo "Nombre de parties = $nb_parties"
    echo "Nombre de parties gagnées = $victoireJ"
    echo -n "Taux de victoire = "
    printf %.3f "$((1000 *   $[ $victoireJ  * 100 ]/$nb_parties  ))e-3"; echo "%"
    echo -n "Score total du Joueur = $scoreJ
Score moyen du Joueur = "
    printf %.2f\\n "$((100 *   $scoreJ/$nb_parties  ))e-2"
}

parcours_histo
affiche_histo
