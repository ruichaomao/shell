#取出log文件中带有“Value”的第二个匹配行
for ff in `ls *log`;do sed -n '/Value/p' $ff | sed -n 2p >> s2s2.dat;done
#取出log文件中带有“Value”的第二个匹配行的第九列
for ff in `ls *log`;do sed -n '/Value/p' $ff | sed -n 1p | awk '{print $9}'>> s1s1.dat;done
#将每一行的数字除以18然后输出到新文件中去
for line in `cat 330_bcl850.dat`;do echo "scale=5;$line/18"| bc >> 330bcl850.dat;done
#将文件夹bcl_addh_gjf中的000.gjf 001.gjf...文件移动到frame0 1 2 ...9文件夹下
for i in 0 1 2 3 4 5 6 7 8 9;do mkdir frame$i;done
for i in 0 1 2 3 4 5 6 7 8 9;do mv bcl_addh_gjf/*"00$i"* frame$i;done
#输出文件夹frame8中所有文件的相对路径，\为转义符
find frame8/* | sed 's/^/.\//' > 888.txt
