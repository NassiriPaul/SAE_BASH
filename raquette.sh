#!/bin/bash

. ./utils.sh


deplacer_raquette() {
    echo
    echo $raquette_position_x $raquette_position_y
    if [ "$key" = "q" ]; then
        charAt $[$raquette_position_x - 1] $raquette_position_y
        if [ $? == '4' ]
        then
            raquette_position_x=$((raquette_position_x - 1))
        fi
    fi
    if [ "$key" = "d" ]; then
        charAt $[$raquette_position_x + $raquette_longeur + 1] $raquette_position_y
        if [ $? == '4' ]
        then
            raquette_position_x=$((raquette_position_x + 1))
        fi
    fi
    echo $raquette_position_x $raquette_position_y
    effacer_raquette
    #afficher_raquette
}

effacer_raquette() {
    
    for ((i=0; i<=raquette_longeur; i++))
    do
        ecrire $raquette_position_y $[$raquette_position_x + i] ' '
    done
    
}

afficher_raquette() {
    local raquette=""
    for ((i=0; i<raquette_longeur; i++))
    do
        raquette="${raquette}${symbole_raquette}"
    done
    ecrire $raquette_position_y $raquette_position_x "$raquette"
}

tester_deplacement() {
    
}
