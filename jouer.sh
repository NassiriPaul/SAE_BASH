#!/bin/bash

. ./raquette.sh
. ./niveau.sh
. ./balle.sh
. ./bot.sh
. ./variables.sh
lire_niveau map.txt
afficher_niveau



debut=$(date +%s%3N)
prochain_deplacement_balle=$debut
prochain_deplacement_bot=$debut
prochaine_acceleration=$debut
while true
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
        lire_niveau
        afficher_niveau
        break
    fi

    if [ "$balle_position_y" -ge "$gb_ys" ] && [ "$balle_position_y" -le "$gb_ye" ] && [ "$balle_position_x" -ge "$gb_xs" ] && [ "$balle_position_x" -le "$gb_xe" ]; then
        lire_niveau 
        afficher_niveau
        break
    fi
done
