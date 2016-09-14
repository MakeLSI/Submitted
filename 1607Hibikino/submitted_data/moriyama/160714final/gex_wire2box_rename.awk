BEGIN{
    FILENAME_PREFIX = "mori_";
}
{
    if ($1 == "w" || $1 == "W"){
#        print $0;
	w = $2 / 2; # wire width
	x0 = $3; y0 = $4; # 1st point
	i = 5;
	for (p = 0; p < (NF - 2) / 2 - 1; p++){
	    x1 = $i; y1 = $(i+1); i+=2;
	    if ($1 == "w"){ x1 += x0; y1 += y0;}

	    dx = x1 - x0; dy = y1 - y0; ld = sqrt(dx*dx + dy*dy);
	    if (ld != 0){
		if (dx != 0 && dy != 0) print"# warning: slant line";
		ux = dx / ld; uy = dy / ld;
		vx = -uy; vy = ux;
		x0r = x0 - w * ux - w * vx;
		y0r = y0 - w * uy - w * vy;
		x1r = x1 + w * ux + w * vx;
		y1r = y1 + w * uy + w * vy;
		print "B",x0r,y0r,x1r,y1r;
	    }
	    x0 = x1; y0 = y1;
	}
    }
    else if ($1 == "c" || $1 == "C"){
#c 19 20 1 1 4 inv1_v2_special.gex
	print $1,$2,$3,$4,$5,$6,FILENAME_PREFIX""$7;
    }
    else{
	print $0;
    }
}
