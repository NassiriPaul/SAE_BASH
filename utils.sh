#!/bin/bash

function ecrire { # X Y Char
  printf "\337\33[%d;%dH%s\338" "$1" "$2" "$3"
}
