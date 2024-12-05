#!/bin/bash

. ./shared/utils.sh
. ./shared/variables.sh

lire_niveau () {
    clear
    nbr_walls=0
    while IFS='\n' read -r line; do
        if [ "${line:0:1}" = 'w' ];
        then
            init_wall $line
        elif [ "${line:0:1}" = 'p' ];
        then
            init_player $line
        elif [ "${line:0:1}" = 'b' ];
        then
            init_bot $line
        elif [ "${line:0:1}" = 'o' ];
        then
            init_ball $line
        elif [ "${line:0:2}" = 'gp' ];
        then
            init_goal_player $line
        elif [ "${line:0:2}" = 'gb' ];
        then
            init_goal_bot $line
        fi
    done < $1;
}

init_wall () {
    nbr_walls=$((nbr_walls+1))

    readarray -d "," -t values <<< "$1"
    let "wall_x_${nbr_walls}=${values[1]}"
    let "wall_y_${nbr_walls}=${values[2]}"
    let "wall_l_${nbr_walls}=${values[3]}"
    let "wall_L_${nbr_walls}=${values[4]}"
}

init_goal_bot () {
    readarray -d "," -t values <<< "$1"
    let "gb_xs=${values[1]}"
    let "gb_ys=${values[2]}"
    let "gb_xe=${values[1]}+${values[3]}"
    let "gb_ye=${values[2]}+${values[4]}"
}

init_goal_player () {
    readarray -d "," -t values <<< "$1"
    let "gp_xs=${values[1]}"
    let "gp_ys=${values[2]}"
    let "gp_xe=${values[1]}+${values[3]}"
    let "gp_ye=${values[2]}+${values[4]}"
}

init_player () {
    readarray -d "," -t values <<< "$1"
    let "raquette_position_x=${values[1]}"
    let "raquette_position_y=${values[2]}"
    let "raquette_longeur=${values[3]}"
}

init_bot () {
    readarray -d "," -t values <<< "$1"
    let "bot_position_x=${values[1]}"
    let "bot_position_y=${values[2]}"
    let "bot_longeur=${values[3]}"
}

init_ball(){
    readarray -d "," -t values <<< "$1"
    let "balle_position_x=${values[1]}"
    let "balle_position_y=${values[2]}"
}

afficher_niveau () {
    clear
    for ((idx_wall=1;idx_wall<=$nbr_walls;idx_wall++))
    do
        wall_x="wall_x_$idx_wall"
        wall_y="wall_y_$idx_wall"
        wall_l="wall_l_$idx_wall"
        wall_L="wall_L_$idx_wall"
        for ((line=wall_x ; line<wall_x+wall_l ; line++))
        do
            for ((column=wall_y ; column<wall_y+wall_L;column++))
            do
                ecrire $column $line $symbole_mur
            done 
        done 
    done
    
    for ((x=$raquette_position_x ; x<=$raquette_position_x+$raquette_longeur ; x++)); do
        ecrire $raquette_position_y $x $symbole_raquette
    done

    for ((xb=$bot_position_x ; xb<=$bot_position_x+$bot_longeur ; xb++)); do
        ecrire $bot_position_y $xb $symbole_bot
    done 
    ecrire $balle_position_y $balle_position_x $symbole_balle
}

