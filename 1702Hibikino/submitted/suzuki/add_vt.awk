BEGIN{
    Nnsl = 0; Npsl = 0; Nnwl = 0; Npwl = 0;
    layer = 0;
    L_NSL = 8; L_PSL = 9; L_VTN = 5; L_VTP = 6; L_NWL = 1; L_PWL = 2;
}
{
    if ($1 == "l" || $1 == "L") layer = $2;
    if ($1 == "b" || $1 == "B"){
	if (layer == L_NSL){
	    xn1[Nnsl] = $2; yn1[Nnsl] = $3; xn2[Nnsl] = $4; yn2[Nnsl] = $5;
#	    print $0;
#	    print "  ",xn1[Nnsl], yn1[Nnsl], xn2[Nnsl], yn2[Nnsl];
	    if ($1 == "b"){ xn2[Nnsl] += xn1[Nnsl]; yn2[Nnsl] += yn1[Nnsl];}
#	    print "->",xn1[Nnsl], yn1[Nnsl], xn2[Nnsl], yn2[Nnsl];
	    if (xn1[Nnsl] > xn2[Nnsl]){
		tmp = xn1[Nnsl]; xn1[Nnsl] = xn2[Nnsl]; xn2[Nnsl] = tmp;
	    }
	    if (yn1[Nsl] > yn2[Nsl]){
		tmp = yn1[Nnsl]; yn1[Nnsl] = yn2[Nnsl]; yn2[Nnsl] = tmp;
	    }
	    fn[Nnsl] = 0;
	    Nnsl++;
	}
	if (layer == L_PSL){
	    xp1[Npsl] = $2; yp1[Npsl] = $3; xp2[Npsl] = $4; yp2[Npsl] = $5;
	    if ($1 == "b"){ xp2[Npsl] += xp1[Npsl]; yp2[Npsl] += yp1[Npsl];}
	    if (xp1[Npsl] > xp2[Npsl]){
		tmp = xp1[Npsl]; xp1[Npsl] = xp2[Npsl]; xp2[Npsl] = tmp;
	    }
	    if (yp1[Npsl] > yp2[Npsl]){
		tmp = yp1[Npsl]; yp1[Npsl] = yp2[Npsl]; yp2[Npsl] = tmp;
	    }
	    fp[Npsl] = 0;
	    Npsl++;
	}
	if (layer == L_NWL){
	    xnw1[Nnwl] = $2; ynw1[Nnwl] = $3; xnw2[Nnwl] = $4; ynw2[Nnwl] = $5;
	    if ($1 == "b"){ xnw2[Nnwl] += xnw1[Nnwl]; ynw2[Nnwl] += ynw1[Nnwl];}
	    if (xnw1[Nnwl] > xnw2[Nnwl]){
		tmp = xnw1[Nnwl]; xnw1[Nnwl] = xnw2[Nnwl]; xnw2[Nnwl] = tmp;
	    }
	    if (ynw1[Nsl] > ynw2[Nsl]){
		tmp = ynw1[Nnwl]; ynw1[Nnwl] = ynw2[Nnwl]; ynw2[Nnwl] = tmp;
	    }
	    Nnwl++;
	}
	if (layer == L_PWL){
	    xpw1[Npwl] = $2; ypw1[Npwl] = $3; xpw2[Npwl] = $4; ypw2[Npwl] = $5;
	    if ($1 == "b"){ xpw2[Npwl] += xpw1[Npwl]; ypw2[Npwl] += ypw1[Npwl];}
	    if (xpw1[Npwl] > xpw2[Npwl]){
		tmp = xpw1[Npwl]; xpw1[Npwl] = xpw2[Npwl]; xpw2[Npwl] = tmp;
	    }
	    if (ypw1[Npwl] > ypw2[Npwl]){
		tmp = ypw1[Npwl]; ypw1[Npwl] = ypw2[Npwl]; ypw2[Npwl] = tmp;
	    }
	    Npwl++;
	}
    }
}
END{
#    print Nnsl, Npsl, Nnwl, Npwl;
    # find NSL inside PWL to add VTN
    print "l",L_VTN;
    for (i = 0; i < Nnsl; i++){
	for (j = 0; j < Npwl; j++){
#	    printf("%d(%d %d)-(%d %d) / %d(%d %d)-(%d %d)\n", i, xn1[i], yn2[i], xn2[i], yn2[i], j, xnw1[j], ynw1[j], xnw2[j], ynw2[j]);
	    if (xn1[i] > xpw1[j] && xn2[i] < xpw2[j] && yn1[i] > ypw1[j] && yn2[i] < ypw2[j]) fn[i] = 1;
	}
	if (fn[i] == 1) print "B",xn1[i], yn1[i], xn2[i], yn2[i];
    }
    # find PSL inside NWL to add VTP
    print "l",L_VTP;
    for (i = 0; i < Npsl; i++){
	for (j = 0; j < Nnwl; j++){
	    if (xp1[i] > xnw1[j] && xp2[i] < xnw2[j] && yp1[i] > ynw1[j] && yp2[i] < ynw2[j]) fp[i] = 1;
	}
	if (fp[i] == 1) print "B",xp1[i], yp1[i], xp2[i], yp2[i];
    }
}
#l 5
#l 6
