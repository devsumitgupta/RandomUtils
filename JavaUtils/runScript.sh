for i in {111161..3657420}
do
`wget www.mysite.com/title/tt$i`
name=`grep "<title>" ./tt$i` 
rating=`grep "titlePageSprite star-box-giga-star" ./tt$i`
if [ ! -z "$name" -a "$name" != " " ]; then
echo $name " ::  " $rating >> ./data1.csv
fi
#echo $name " ::  " $rating >> ./data1.csv
#`awk '{print($3)}'`
`rm ./tt$i`
done
java Crawler
