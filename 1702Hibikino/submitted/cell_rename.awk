BEGIN{
    if (prefix == "") prefix = "tt_";
}
{
    if ($1 == "c" || $1 == "C"){
	print $1,$2,$3,$4,$5,$6,prefix""$7;
    }
    else print $0;
}
