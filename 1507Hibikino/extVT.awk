# NSL=8 -> VTN=5
# PSL=9 -> VTP=6

BEGIN{st = 0;}
{
    if (st == 0 && $1 == "l" && ($2 == 8 || $2 == 9)) st = 1
    if (st == 1 && $1 == "l" && $2 != 8 && $2 != 9) st = 0;
    if (st == 1){
	if ($1 == "l") print "l",$2-3;
	else print $0;
    }

}
