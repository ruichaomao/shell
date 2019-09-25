for ff in `ls *log`;do sed -n '/Value/p' $ff | sed -n 2p >> s2s2.dat;done
