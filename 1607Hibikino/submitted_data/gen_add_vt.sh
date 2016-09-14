ls -l | gawk '{print"cp",$NF,"VT/";print"gawk -f add_vt.awk",$NF,">> VT/"$NF}' > a.sh
