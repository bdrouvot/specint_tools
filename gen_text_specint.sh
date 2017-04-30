# save html page
curl -s https://www.spec.org/cpu2006/results/rint2006.html > specint2006.html
# convert to text
textutil -convert txt "specint2006.html"
# build the txt file as we want to (mainly inspired by Karl Arao)
awk '{if($1~/^HTML/){l1=$0;getline;l2=(l1";"$0);getline;l3=(l2";"$0);getline;l4=(l3";"$0);getline;l5=(l4";"$0);getline;l6=(l5";"$0);getline;l7=(l6";"$0);getline;print l7";"$0" "p;p=""} else {if($1~/^Peak/){p=""} else {p=(p";"$0)}}}'  specint2006.txt > specint1.txt
awk '{split($0,a,"HTML");$1=a[1] ; $2=a[2]; print $2,$1}' specint1.txt > specint2.txt
awk -F';' '{print $8/$3";", $0}' specint2.txt > specint.txt
rm specint2006.html specint2006.txt specint1.txt specint2.txt 
