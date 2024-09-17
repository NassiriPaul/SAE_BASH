#!/bin/bash

. ./balle.sh
. ./variables.sh

position_balle_x=1
position_balle_y=0
vel_balle_x=1
vel_balle_y=0

echo "    #
            
 o    #
         
#        
   #
   
#"

obj_step=13
step=0

while [ "$step" -ne "$obj_step" ];
do

    step=$((step + 1))
    deplacer_balle
done

if [ "$position_balle_x" -ne 2] || [ "$position_balle_y" -ne 5]; then
    echo "Devrait etre x=2 y=5 mais x⁼$position_balle_x et y = $position_balle_y"
    exit
fi
echo "test reussi"