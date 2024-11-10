#!/bin/bash

. ./utils.sh


deplacer_raquette() {
    if [ "$key" = "q" ]; then
        charAt $[$raquette_position_x - 1] $raquette_position_y
        result=$?
        if [ "$result" == '4' ]
        then
            ecrire $raquette_position_y $[$raquette_position_x + $raquette_longeur] ' '
            raquette_position_x=$((raquette_position_x - 1))
            ecrire $raquette_position_y $[$raquette_position_x] ${symbole_raquette}
        fi
    fi
    if [ "$key" = "d" ]; then
        charAt $[$raquette_position_x + $raquette_longeur + 1] $raquette_position_y
        result=$?
        if [ "$result" == '4' ]
        then
            ecrire $raquette_position_y $[$raquette_position_x] ' '
            raquette_position_x=$((raquette_position_x + 1))
            ecrire $raquette_position_y $[$raquette_position_x + $raquette_longeur] ${symbole_raquette}
        fi
    fi
}

effacer_raquette() {
    
    for ((i=0; i<=raquette_longeur; i++))
    do
        ecrire $raquette_position_y $[$raquette_position_x + i] ' '
    done
    
}

afficher_raquette() {
    for ((i=0; i<=raquette_longeur; i++))
    do
        ecrire $raquette_position_y $[$raquette_position_x + i] ${symbole_raquette}
    done
}
