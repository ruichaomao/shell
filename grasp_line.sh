1#取出log文件中带有“Value”的第二个匹配行
for ff in `ls *log`;do sed -n '/Value/p' $ff | sed -n 2p >> s2s2.dat;done

2#取出log文件中带有“Value”的第二个匹配行的第九列
for ff in `ls *log`;do sed -n '/Value/p' $ff | sed -n 1p | awk '{print $9}'>> s1s1.dat;done

3#将每一行的数字除以18然后输出到新文件中去
for line in `cat 330_bcl850.dat`;do echo "scale=5;$line/18"| bc >> 330bcl850.dat;done

4#将文件夹bcl_addh_gjf中的000.gjf 001.gjf...文件移动到frame0 1 2 ...9文件夹下
for i in 0 1 2 3 4 5 6 7 8 9;do mkdir frame$i;done
for i in 0 1 2 3 4 5 6 7 8 9;do mv bcl_addh_gjf/*"00$i"* frame$i;done

5#输出文件夹frame8中所有文件的相对路径，\为转义符
find frame8/* | sed 's/^/.\//' > 888.txt

6#将gjf文件转换成xyz文件
for i in `ls *dat`;
 do
     aa=`echo $i | sed 's/\.dat//g'`
     echo $aa
     wc -l $i | awk {'print $1 - 11'} > $aa.xyz;echo '' >>$aa.xyz
     head -n -3 $i | tail -n +9 >> $aa.xyz
     done
7#求和，取平均，取极值等
cat r_270.dat | awk '{sum+=$1} END {print "average=",sum/NR}'     #sum
cat data|awk '{sum+=$1} END {print "Average = ", sum/NR}'     #average
cat data|awk 'BEGIN {max = 0} {if ($1>max) max=$1 fi} END {print "Max=", max}'   #max
cat data|awk 'BEGIN {min = 1999999} {if ($1<min) min=$1 fi} END {print "Min=", min}'    #min

