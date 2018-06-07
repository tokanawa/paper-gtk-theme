#! /bin/bash

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

SRC_FILE="assets-dark.svg"
ASSETS_DIR="assets-dark"
INDEX="assets.txt"

for i in `cat $INDEX`
do
if [ -f $ASSETS_DIR/$i-dark.png ]; then
    echo $ASSETS_DIR/$i-dark.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i-dark.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-background-opacity=0 \
              --export-png=$ASSETS_DIR/$i-dark.png $SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i-dark.png
fi
done
exit 0
