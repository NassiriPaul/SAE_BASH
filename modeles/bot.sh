#!/bin/bash

. ./shared/utils.sh
. ./shared/variables.sh

deplacer_bot() {
    
    if [ $((bot_position_x)) -gt $((balle_position_x)) ] 
    then
        charAt $[$bot_position_x - 1] $bot_position_y
        result=$?
        if [ "$result" == '4' ]
        then
            ecrire $bot_position_y $[$bot_position_x + $bot_longeur] ' '
            bot_position_x=$((bot_position_x - 1))
            ecrire $bot_position_y $[$bot_position_x] ${symbole_bot}
        fi
    elif [ $((bot_position_x + bot_longeur )) -lt $((balle_position_x)) ] 
    then
        charAt $[$bot_position_x + $bot_longeur + 1] $bot_position_y
        result=$?
        if [ "$result" == '4' ]
        then
            ecrire $bot_position_y $[$bot_position_x ] ' '
            bot_position_x=$((bot_position_x + 1))
            ecrire $bot_position_y $[$bot_position_x + $bot_longeur] ${symbole_bot}
        fi
    fi
}