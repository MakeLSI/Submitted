gawk '{print"gawk -v prefix=\"ka_\" -f cell_rename.awk",$NF,">",$NF"_";print"mv",$NF,"_"$NF;print"mv",$NF"_",$NF;}' cell_rename.list | sh
ls -l | gawk '{print"mv",$NF,"ka_"$NF}' > rename.sh
