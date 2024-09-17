#!/bin/sh

. ./variables.sh
. ./niveau.sh

for numero_test in 1 2 3 4 5 6 7 8 9 10
do
  lire_niveau niveaux_test_$numero_test.txt > tests/niveaux/niveaux_test_charge_$numero_test.txt

  if [ $numero_test == 1 ]
	then
		if [ $raquette_position_x != 5 ] || [ $raquette_position_y != 7 ] || [ $raquette_longeur != 2 ];
    then
      echo "Test 1 raté : $raquette_position_x $raquette_position_y $raquette_longeur"
    fi
	elif [ $numero_test == 3 ]
	then
		if [ $raquette_position_x != 5 ] || [ $raquette_position_y != 4] || [ $raquette_longeur != 2 ];
    then
      echo "Test 2 raté : $raquette_position_x $raquette_position_y $raquette_longeur"
    fi
	elif [ $numero_test == 5 ]
	then
		if [ $raquette_position_x != 5 ] || [ $raquette_position_y != 9 ] || [ $raquette_longeur != 4 ];
    then
      echo "Test 3 raté : $raquette_position_x $raquette_position_y $raquette_longeur"
    fi
	fi

  # test 2 : Comparer la sortie avec le fichier attendu
  if cmp -s tests/niveaux/niveaux_test_charge_$numero_test.txt tests/niveaux/sortie_attendu_$numero_test.txt; then
    echo "Test $numero_test réussi"
  else
    echo "Test $numero_test échoué"
    echo "Différences :"
    diff tests/niveaux/niveaux_test_charge_$numero_test.txt tests/niveaux/sortie_attendu_$numero_test.txt
    exit 1
  fi
done

for numero_test in 1 2 3 4 5 6 7 8 9 10
do
  lire_niveau niveaux_test_$numero_test.txt > tests/niveaux/niveaux_test_charge_$numero_test.txt

  # Étape 2 : Comparer la sortie avec le fichier attendu
  if cmp -s tests/niveaux/niveaux_test_charge_$numero_test.txt tests/niveaux/sortie_attendu_$numero_test.txt; then
    echo "Test $numero_test réussi"
  else
    echo "Test $numero_test échoué"
    echo "Différences :"
    diff tests/niveaux/niveaux_test_charge_$numero_test.txt tests/niveaux/sortie_attendu_$numero_test.txt
    exit 1
  fi
done