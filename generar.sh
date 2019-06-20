#!/bin/zsh

while read p; do
    echo -n $p
    sed -e "s/xxxxx/$p/" diploma.svg > tmp.svg
    if [ $(expr length $p) -ge 40 ]; then
        echo -n " ***"
        sed -e "s/56px/40px/" tmp.svg > tmp2.svg
        mv -f tmp2.svg tmp.svg
    elif [ $(expr length $p) -ge 30 ]; then
        echo -n " ***"
        sed -e "s/56px/44px/" tmp.svg > tmp2.svg
        mv -f tmp2.svg tmp.svg
    fi
    inkscape tmp.svg -A "diplomas/$p.pdf"
    rm tmp.svg
    echo
done < empresas.txt
