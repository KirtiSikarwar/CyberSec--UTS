#!/bin/bash

#To run program: ./roulette_dealer_finder_by_time_and_game.sh
#arguments:
#$1[date MMDD] - 0310/0312/0315
#2[2-digit hour] - eg -05/08/02
#3[AM or PM]
#$4/$5 - change it for the column details of the Game (First name and Last Name of the game

#Execution : ./roulette_dealer_finder_by_time_and_game.sh 0310 05 AM [$3 $4] - brackets not needed only single quotes
#05:00:00 AM Katey Bean


#!/bin/bash

awk '{print $1, $2, '$4', '$5'}' $1_Dealer_schedule | grep "$2:00:00 $3"


