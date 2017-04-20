BEGIN{FS=":";pre="";}
{
    if ($1 != pre) print $1;
    pre = $1;
}

