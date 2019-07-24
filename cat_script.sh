#!/usr/bin/env bash

# A short script that draws random cat
# ascii from a selection that can be
# extended and/or changed.
# Code by Peleg Bar Sapir
# ASCII art from https://user.xmission.com/~emailbox/ascii_cats.htm

CATPATH=/home/$USER/cat_ascii/cats.ascii

# Range for selecting a drawing
FLOOR=1;
CEILING=41;
RANGE=$(($CEILING-$FLOOR+1));

# Random drawing
RESULT=$RANDOM;
let "RESULT %= $RANGE";

# Get line numbers range of drawing
RESULT1=$((RESULT+FLOOR));
RESULT2=$((RESULT1+1))
LN1=$(awk "/NEWCAT/{++n; if (n==$RESULT1){ print NR; exit}}" $CATPATH)
LN2=$(awk "/NEWCAT/{++n; if (n==$RESULT2){ print NR; exit}}" $CATPATH)

# Draw cats.ascii in line range
awk "NR > $LN1 && NR < $LN2" $CATPATH
printf "\n\n"
