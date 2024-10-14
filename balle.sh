#!/bin/bash

. ./utils.sh
. ./variables.sh

dir_h=-1 #-1 gauche; 1 droite ?
dir_v=-1 #-1 haut, ...
suite_x=-1
suite_y=-1
velo=1

input="./niveau_test_2.txt"

update_dir_horiz(){
    dir_h=$[ -1 * $dir_h]
}
update_dir_vert(){
    dir_v=$[ -1 * $dir_v]
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
        update_dir_vert
    fi
    charAt $balle_position_x $[ $balle_position_y + 1]
    if [ "$?" -ne 4 ]
    then
        update_dir_horiz
    fi
    charAt $[$balle_position_x - 1] $balle_position_y
    if [ "$?" -ne 4 ]
    then
        update_dir_vert
    fi
    charAt $balle_position_x $[ $balle_position_y - 1]
    if [ "$?" -ne 4 ]
    then
        update_dir_horiz
    fi
    balle_position_x=$[ $balle_position_x + $[ velo * dir_v] ]
    balle_position_y=$[ $balle_position_y + $[ velo * dir_h ] ]

    afficher_balle
}

