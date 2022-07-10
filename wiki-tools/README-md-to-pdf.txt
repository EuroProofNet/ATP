function FILE_REF
{
    echo
    echo '<a id="'${1%.md}'" />'
    echo
    cat $1
}

FILE_REF Home.md > afile.md
FILE_REF How-to-contribute.md >> afile.md
FILE_REF List-of-formats.md >> afile.md
FILE_REF List-of-systems.md >> afile.md

# removre the templates!!!!!
for i in Format-*.md; do
    FILE_REF $i >> afile.md
done
# removre the templates!!!!!
for i in System-*.md; do
    FILE_REF $i >> afile.md
done

sed "s/\[\[\(.*\)|\(.*\)\]\]/[ [\1] ](#\2)/g" afile.md > afile2.md
mv -f afile2.md afile.md

pandoc -t latex afile.md -o result.tex
