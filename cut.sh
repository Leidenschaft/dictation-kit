set -e -x
filename="j2-16-1.MP3"
file="../../Japanese/j2-audio-wav/$filename.wav"
echo "$file" > test.dbl
../julius/julius/julius -C main.jconf -C am-dnn.jconf -dnnconf julius.dnnconf > a.txt
python3 get_split_time.py | xargs -I{} ffmpeg -y -i "../../Japanese/j2-audio-wav/$filename" -t {} "../../Japanese/j2-audio-cut/$filename"
