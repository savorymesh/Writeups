#!/usr/bin/env bash
FILES=*.md
for file in $FILES 
do
    filename="${file%.*}"
    echo "Converting $file to $filename.html"
    pandoc -s \
        --toc \
        --toc-depth=3 \
        --mathjax \
        -c pandoc.css \
        $file \
        -o $filename.html
done
mv *.html ../HTML/

