#!/bin/bash
# this script takes a tex-file that contains one tabular and converts this to markdown format
# such that I can copy-paste the table to my wiki
# it takes a tex file as input and spits out the same file with the suffix .tex replaced by .md

# the table starts right after \begin{tabular}, so we use grep to find the line, have it
# spit out the line number and use cut to only keep that line number
b=`grep -n "begin{tabular}" $1 | cut -f1 -d:`

# we need to increment the line number by one because the table begins after \begin{tabular}
let b=$b+1

# we do the same looking for the end of table which is right before \end{tabular}
e=`grep -n "end{tabular}" $1 | cut -f1 -d:`
let e=$e-1
nm=$1 #that's our file...

# and we do the first line, i.e. the heading, separately because the delimiters differ between
# header and body for a table in markdown format
sed -n "${b},${b}p" $1 | sed -e 's,&,^,g' | sed -e 's,\\\\,^,g' | sed -e 's,\\tabularnewline,^,g' | awk '{print "^ " $0}' > ${nm%%tex}md

# the header is done, increase the beginning line by one
let b=$b+1
sed -n "${b},${e}p" $1 | awk -F"&" '{ gsub(":","_",$7);print "| " $0}' | sed -e 's,&,|,g' | sed -e 's,\\\\,|,g' | sed -e 's,\\tabularnewline,|,g' | sed -e 's,\\{\\{,{{,g' | sed -e 's,\\}\\},}},g' | sed -e 's,\\_,_,g' | sed -e 's,   ,  |,g' >> ${nm%%tex}md

