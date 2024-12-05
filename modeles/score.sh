#!/bin/bash

. ./shared/utils.sh

function dessine_score {
    test $# -ne 4 && echo "Nombre invalide de paramètres (nb accepté : 4) dans dessine_score" > /dev/stderr && exit 1
    dessine $1 $2 $4
    ecrire $[ $1 + 1] $[ $2 + 7 ] "█"
    ecrire $[ $1 + 3] $[ $2 + 7 ] "█"
    dessine $1 $[ $2 + 12 ] $3
}

function dessine {
    test $# -ne 3 && echo "Nombre invalide de paramètres (nb accepté : 3) dans dessine" > /dev/stderr && exit 1
    debutx=$1
    debuty=$2
    shift ; shift;
    case "$1" in
        "0")
        ecrire $debutx $debuty "█"
        ecrire $[ $debutx + 0 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 0 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 1 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 1 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 3 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 3 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 2 ] "█"
        ;;
        "1")
        ecrire $[ $debutx + 0 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 1 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 3 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 2 ] "█"
        ;;
        "2")
        ecrire $debutx $debuty "█"
        ecrire $[ $debutx + 0 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 0 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 1 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 3 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 2 ] "█"
        ;;
        "3")
        ecrire $debutx $debuty "█"
        ecrire $[ $debutx + 0 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 0 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 1 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 3 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 2 ] "█"
        ;;
        "4")
        ecrire $debutx $debuty "█"
        ecrire $[ $debutx + 0 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 1 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 1 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 3 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 2 ] "█"
        ;;
        "5")
        ecrire $debutx $debuty "█"
        ecrire $[ $debutx + 0 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 0 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 1 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 3 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 2 ] "█"
        ;;
        "6")
        ecrire $debutx $debuty "█"
        ecrire $[ $debutx + 0 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 0 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 1 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 3 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 3 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 2 ] "█"
        ;;
        "7")
        ecrire $debutx $debuty "█"
        ecrire $[ $debutx + 0 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 0 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 1 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 3 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 2 ] "█"
        ;; #le 8 et le 9 existe au cas où
        "8")
        ecrire $debutx $debuty "█"
        ecrire $[ $debutx + 0 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 0 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 1 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 1 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 3 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 3 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 2 ] "█"
        ;;
        "9")
        ecrire $debutx $debuty "█"
        ecrire $[ $debutx + 0 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 0 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 1 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 1 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 2 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 3 ] $[ $debuty + 2 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 0 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 1 ] "█"
        ecrire $[ $debutx + 4 ] $[ $debuty + 2 ] "█"
    esac
}

function efface_score {
    test $# -ne 2 && echo "Nombre invalide de paramètres (nb accepté : 2) dans efface_score" > /dev/stderr && exit 1
    for i in `seq $1 $[ $1 + 5 ]`
    do
        for j in `seq $2 $[ $2 + 3 ]`
        do
            ecrire $i $j " "
        done
    done
}
