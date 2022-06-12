
#To run program: ./roulette_dealer_finder_by_time.sh
#arguments:
#$1[date MMDD] - 0310/0312/0315
#2[2-digit hour] - eg -05/08/02
#3[AM or PM]

#Execution : ./roulette_dealer_finder_by_time.sh 0310 05 AM 
#./roulette_dealer_finder_by_time.sh 0310 05 AM
#05:00:00 AM Billy Jones

#./roulette_dealer_finder_by_time.sh 0310 03 PM
#03:00:00 PM Evalyn Howell



#!/bin/bash

awk '{print $1, $2, $5, $6}' $1_Dealer_schedule | grep "$2:00:00 $3"





