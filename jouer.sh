#!/bin/bash

. ./raquette.sh
. ./niveau.sh
. ./balle.sh
. ./bot.sh
. ./variables.sh
. ./score.sh

function reset_velocity {
    velocity=200
}
    
function jeux {
    map="map.txt" #Si on arrive a faire une fonction de carte random, on pourra faire un $? 
    lire_niveau "$map"
    afficher_niveau



    debut=$(date +%s%3N)
    prochain_deplacement_balle=$debut
    prochain_deplacement_bot=$debut
    prochaine_acceleration=$debut
    scoreP=0
    scoreB=0
    pos_score=4

    dessine_score $pos_score $[ $pos_score + 1 ] $scoreB $scoreP
    while [ $scoreB -lt $score_victoire ] && [ $scoreP -lt $score_victoire ] 
    do
        read -rsn1 -t 0.001 key
        deplacer_raquette

        if [ $(date +%s%3N) -ge "$prochain_deplacement_balle" ]
        then
            deplacer_balle
            prochain_deplacement_balle=$((prochain_deplacement_balle + velocity))
        fi

        if [ $(date +%s%3N) -ge "$prochaine_acceleration" ]
        then
            if [ $velocity -gt $min_velocity ]
            then
                velocity=$((velocity - 5))
            fi
            prochaine_acceleration=$((prochaine_acceleration + 2000))
        fi

        if [ $(date +%s%3N) -ge "$prochain_deplacement_bot" ]
        then
            deplacer_bot
            prochain_deplacement_bot=$((prochain_deplacement_bot + 100))
        fi
        
        if [ "$balle_position_y" -ge "$gp_ys" ] && [ "$balle_position_y" -le "$gp_ye" ] && [ "$balle_position_x" -ge "$gp_xs" ] && [ "$balle_position_x" -le "$gp_xe" ]; then
            scoreB=$[ $scoreB + 1 ]
            lire_niveau "$map"
            afficher_niveau
            dessine_score $pos_score $[ $pos_score + 1 ] $scoreB $scoreP
            reset_velocity
        fi

        if [ "$balle_position_y" -ge "$gb_ys" ] && [ "$balle_position_y" -le "$gb_ye" ] && [ "$balle_position_x" -ge "$gb_xs" ] && [ "$balle_position_x" -le "$gb_xe" ]; then
            scoreP=$[ $scoreP + 1 ]
            lire_niveau "$map"
            afficher_niveau
            dessine_score $pos_score $[ $pos_score + 1 ] $scoreB $scoreP
            reset_velocity
        fi
    done

    test -e "./historique.txt"
    if [ $? -eq 1 ]
    then
        echo "Historique des parties : 
        " >> ./historique.txt
    fi
    if [ $scoreB -gt $scoreP ]
    then
    echo "Victoire de l'ordinateur !
Score Joueur : $scoreP
Score Ordinateur : $scoreB
    " >> ./historique.txt
    else
    echo "Victoire du Joueur !
Score Joueur : $scoreP
Score Ordinateur : $scoreB
    " >> ./historique.txt
fi
        echo "Appuyer sur entrée pour retourner au menu"
        read -s -n 1 key
        while [[ $key != "" ]]; do
            read -s -n 1 key
        done
}