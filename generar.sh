#!/bin/zsh

while read p; do
    echo -n $p
    sed -e "s/xxxxx/$p/" diploma.svg > tmp.svg
    if [ $(expr length $p) -ge 35 ]; then
        echo -n " ***"
        sed -e "s/72px/56px/" tmp.svg > tmp2.svg
        mv -f tmp2.svg tmp.svg
    fi
    inkscape tmp.svg -A "diplomas/$p.pdf"
    rm tmp.svg
    echo
done < empresas.txt
