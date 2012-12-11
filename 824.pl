#!/usr/bin/perl

#
# 824年に一度らしいカレンダーの並び。
# 条件：土日月が5回あること。＝31日ある月でなおかつ、1日が土曜日であること
#      12月 2012
# 日 月 火 水 木 金 土
#                    1
#  2  3  4  5  6  7  8
#  9 10 11 12 13 14 15
# 16 17 18 19 20 21 22
# 23 24 25 26 27 28 29
# 30 31

$yearstart = 1900 ;
$yearend   = 2100 ;

@tgtmonth = (1,3,5,7,8,10,12);

for ( $iy = $yearstart ; $iy <= $yearend ; $iy ++ )
{
    foreach $im ( @tgtmonth )
    {
        if ( $im == 1 || $im == 2 ) 
        {
            $cyr = $iy - 1 ; 
            $cmt = $im + 12 ;
        }
        else
        {
            $cyr = $iy ;
            $cmt = $im ;
        }
        $day = 1 ;
        $wday = ( $cyr + int($cyr/4) - int($cyr/100) + int($cyr/400) + int((13*$cmt + 8)/5) + $day) %7;
        if ( $wday == 6 )
        {
            printf( "%4d年 %2d月 が　824年に一度！\n" , $iy , $im ) ;
        }
    }
}

