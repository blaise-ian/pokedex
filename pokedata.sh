#!/bin/bash

#usage ./pokedata.sh <name> <url>
curl -sS "$2" > "$1.json"
