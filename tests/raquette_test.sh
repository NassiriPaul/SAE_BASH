#!/bin/sh

source ./variables.sh
source ./raquette.sh

raquette_position_x=6
raquette_position_y=9
raquette_position_x_p=6
raquette_position_y_p=9
raquette_longeur=2

clear
echo "##############
#            #
#            #
#    ███     #
#    ███     #
#            #
#            #
#            #
#            #
#     ▔▔     #"

while [ true ];
do
  deplacer_raquette
  if [ $raquette_position_x != $raquette_position_x_p ] || [ $raquette_position_y != $raquette_position_y_p ];
  then
    raquette_position_x_p=$raquette_position_x
    raquette_position_y_p=$raquette_position_y
    effacer_raquette
    afficher_raquette
  fi
  sleep 0.1
done