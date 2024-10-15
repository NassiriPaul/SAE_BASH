#!/bin/bash

. ./raquette.sh
. ./niveau.sh

lire_niveau map.txt
afficher_niveau

while true; do
    read -rsn1 key
    deplacer_raquette
done
