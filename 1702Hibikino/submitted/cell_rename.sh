gawk '{print"gawk -v prefix=\"su_\" -f cell_rename.awk",$NF,">",$NF"_";print"mv",$NF,"_"$NF;print"mv",$NF"_",$NF;}' cell_rename.list | sh
ls -l | gawk '{print"mv",$NF,"su_"$NF}' > rename.sh


