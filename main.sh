. ./niveau.sh
. ./balle.sh
lire_niveau "./map.txt"
afficher_niveau

while true; do
    deplacer_balle $balle_position_x $balle_position_y

    sleep 1
done