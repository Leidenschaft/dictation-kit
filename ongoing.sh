ffmpeg -i /media/zhaofeng/我的光盘/1/TRACK04.MP3 -y -ac 1 -ar 16000 a.wav
../julius/julius/julius -C main.jconf -C am-dnn.jconf -dnnconf julius.dnnconf > a.txt
grep "sentence1.*" a.txt > b.txt
sed -i 's/sentence1:  //g' b.txt