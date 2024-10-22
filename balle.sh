#!/bin/bash

. ./utils.sh
. ./variables.sh

dir_h=-1 #-1 gauche; 1 droite ?
dir_v=-1 #-1 haut, ...


rebond_hasard(){
    if [ $# -gt 0 ]
    then
        direction=$(($1*($RANDOM % 2)))
    else
        direction=$((1-$RANDOM % 3))
    fi

    dir_h=$direction
}

update_dir_horiz(){
    dir_h=$(( -1 * dir_h ))
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
    if [ $dir_h -eq 0 ]
    then
        charAt $((balle_position_x - 1)) $((balle_position_y - dir_v))
        colG=$?
        charAt $balle_position_x $((balle_position_y + dir_v))
        ligne=$?
        charAt $((balle_position_x + 1 )) $((balle_position_y - dir_v))
        colD=$?

        if [ $ligne != "4" ]
        then
            if [ $colG != "4" ]
            then
                rebond_hasard 1
            elif [ $colD != "4" ]
            then
                rebond_hasard -1
            else
                rebond_hasard
            fi
            update_dir_vert
        fi
    else
        charAt $((balle_position_x + dir_h)) $balle_position_y
        colonne=$?
        charAt $((balle_position_x + dir_h)) $((balle_position_y + dir_v))
        coin=$?
        charAt $balle_position_x $((balle_position_y + dir_v))
        ligne=$?

        if [ $colonne != "4" ] && [ $ligne != "4" ]
        then
            rebond_hasard $((-1*dir_h))
            update_dir_vert
        elif [ $colonne = "4" ] && [ $ligne = "4" ] && [ $coin != "4" ]
        then
            rebond_hasard $((-1*dir_h))
            update_dir_vert
        elif [ $colonne != "4" ]
        then
            update_dir_horiz
        elif [ $ligne != "4" ]
        then
            rebond_hasard
            update_dir_vert
        fi
    fi
    balle_position_x=$[ $balle_position_x + $[ dir_h ] ]
    balle_position_y=$[ $balle_position_y + $[ dir_v ] ]

    afficher_balle
}

