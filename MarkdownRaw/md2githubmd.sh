#!/usr/bin/env bash
FILES=*.md
for file in $FILES 
do
    filename="${file%.*}"
    echo "Converting $file to Github-flavored markdown with embedded LaTeX"
    python2 -m readme2tex --nocdn --output ${filename}_github.md $file 
    sed -i 's/?invert_in_darkmode//g' ${filename}_github.md
done
mv *_github.md ../GithubMarkdown/
cp -r svgs ../GithubMarkdown/svgs
