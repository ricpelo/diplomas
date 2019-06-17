#!/bin/sh

while read p; do
    echo $p
    sed -e "s/xxxxx/$p/" diploma.svg > tmp.svg
    inkscape tmp.svg -A "diplomas/$p.pdf"
    rm tmp.svg
done < empresas.txt
