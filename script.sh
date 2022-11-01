#!/bin/sh

CHOSENBOOK=`ls KJV | shuf -n 1`
BOOKTITLE=`head -n 1 KJV/$CHOSENBOOK |cut -d "-" -f 1`

VERSE=`shuf -n 1 KJV/"$CHOSENBOOK"`
VERSENUM=`echo $VERSE |cut -d "]" -f 1 |cut -d "[" -f 2`

TITLE="$BOOKTITLE$VERSENUM"
QUOTATION=`echo $VERSE |cut -d "]" -f 2`

# echo $TITLE
# echo $QUOTATION

# this code is shit (2022) update

head -n 11 dailyverse.xml > temp.xml

echo "
<item>
<title>$TITLE</title>
<pubDate>`date`</pubDate>
<description><![CDATA[<p>$QUOTATION</p>]]></description>
</item>" >> temp.xml

sed '1,/<!-- VALKUNXYZ -->/d' dailyverse.xml >> temp.xml

mv temp.xml dailyverse.xml
