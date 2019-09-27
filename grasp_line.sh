#取出log文件中带有“Value”的第二个匹配行
for ff in `ls *log`;do sed -n '/Value/p' $ff | sed -n 2p >> s2s2.dat;done
#取出log文件中带有“Value”的第二个匹配行的第九列
for ff in `ls *log`;do sed -n '/Value/p' $ff | sed -n 1p | awk '{print $9}'>> s1s1.dat;done
#将每一行的数字除以18然后输出到新文件中去
for line in `cat 330_bcl850.dat`;do echo "scale=5;$line/18"| bc >> 330bcl850.dat;done
