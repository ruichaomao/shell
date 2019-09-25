#取出log文件中带有“Value”的第二个匹配行
for ff in `ls *log`;do sed -n '/Value/p' $ff | sed -n 2p >> s2s2.dat;done
#取出log文件中带有“Value”的第二个匹配行的第九列
for ff in `ls *log`;do sed -n '/Value/p' $ff | sed -n 1p | awk '{print $9}'>> s1s1.dat;done
