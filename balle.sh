#!/bin/bash

. ./utils.sh
. ./variables.sh

dir_h=-1 #-1 gauche; 1 droite ?
dir_v=-1 #-1 haut, ...
suite_x=-1
suite_y=-1
velo=1

input="./niveau_test_2.txt"

rebond_hasard(){
    hasard=$((RANDOM % 3))
    if [ $hasard -eq 0 ]
    then
        dir_h=$((-1))
    elif [ $hasard -eq 1 ]
    then
        dir_h=$((0))
    else
        dir_h=$((1))
    fi
}

update_dir_horiz(){
    if [ $dir_h -ne 0 ]
    then
        dir_h=$(( -1 * dir_h ))
    else
        rebond_hasard
    fi
}



update_dir_vert(){
    dir_v=$(( -1 * dir_v ))
}

afficher_balle(){
    ecrire $balle_position_y $balle_position_x $symbole_balle
}
effacer_balle(){
    ecrire $balle_position_y $balle_position_x " "  
}

deplacer_balle(){
    effacer_balle
    
    charAt $[$balle_position_x + 1] $balle_position_y
    if [ "$?" -ne 4 ]
    then
        update_dir_horiz
    fi

    charAt $[$balle_position_x - 1] $balle_position_y
    if [ "$?" -ne 4 ]
    then
        update_dir_horiz
    fi

    charAt $balle_position_x $[ $balle_position_y + 1]
    if [ "$?" -ne 4 ]
    then
        update_dir_vert
        rebond_hasard
    fi
    charAt $balle_position_x $[ $balle_position_y - 1]
    if [ "$?" -ne 4 ]
    then
        update_dir_vert
        rebond_hasard
    fi

    balle_position_x=$[ $balle_position_x + $[ dir_h ] ]
    balle_position_y=$[ $balle_position_y + $[ dir_v ] ]

    afficher_balle
}

