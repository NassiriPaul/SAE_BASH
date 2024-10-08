#!/bin/bash

function ecrire { # X Y Char
  printf "\337\33[%d;%dH%s\338" "$1" "$2" "$3"
}



function charAt {
  coordX=$1
  coordY=$2

  for ((idx_wall=1;idx_wall<=$nbr_walls;idx_wall++)); do
      wall_x="wall_x_$idx_wall"
      wall_y="wall_y_$idx_wall"
      wall_l="wall_l_$idx_wall"
      wall_L="wall_L_$idx_wall"
      for ((line=wall_x ; line<wall_x+wall_l ; line++)); do
          for ((column=wall_y ; column<wall_y+wall_L;column++)); do
              if [ "${line}" = "${coordX}" ] && [ "${column}" = "${coordY}" ]
              then
                  return '1'
              fi
          done 
      done 
  done
    
  for ((x=$raquette_position_x ; x<=$raquette_position_x+$raquette_longeur ; x++)); do
      if [ "${x}" = "${coordX}" ] && [ "${raquette_position_x}" = "${coordY}" ]
      then
          return '2'
      fi
  done

  for ((xb=$bot_position_x ; xb<=$bot_position_x+$bot_longeur ; xb++)); do
      if [ "${xb}" = "${coordX}" ] && [ "${bot_position_y}" = "${coordY}" ]
      then
          return '3'
      fi
  done

  return '4'
}
