#!/bin/bash
if (( $# == 1 )); then
	lat=`cat worldcities.csv | grep -E -m 1 "$1" | cut -d "," -f 3`
	lat=${lat:1:${#lat}-2}
	long=`cat worldcities.csv | grep -E -m 1 "$1" | cut -d "," -f 4`
	long=${long:1:${#long}-2}
	s=https://darksky.net/forecast/$lat,$long/us12/en
	curl -s $s>weather.txt
else
	s=https://darksky.net/forecast/$1,$2/us12/en
	curl -s $s>weather.txt
fi
echo -n "Temperature at this place: "
cat weather.txt | grep -E "<span class=\"summary swap\">" | grep -E -o "[[:digit:]]*"
echo
echo -n "Weather at this place: "
cat weather.txt | grep -E "<span class=\"summary swap\">" | grep -E -o "\;.*\." | sed -n 's/;//p'
echo
echo -n "Wind speed at this place: "
cat weather.txt | grep -E "<span class=\"num swip wind__speed__value\">" | grep -E -o "[[:digit:]]*"
echo
echo -n "Humidity at this place: "
cat weather.txt | grep -E "<span class=\"num swip humidity__value\">" | grep -E -o "[[:digit:]]*"
echo
echo -n "Dew point value at this place: "
cat weather.txt | grep -E "<span class=\"num dew__point__value\">" | grep -E -o "[[:digit:]]*"
rm -rf weather.txt
