set -e -x
for filename_total in ../../Japanese/j2-audio/*; do
    filename=$(basename "$filename_total")
    file="../../Japanese/j2-audio-wav/$filename.wav"
    echo "$file" > test.dbl
    ../julius/julius/julius -C main.jconf -C am-dnn.jconf -dnnconf julius.dnnconf > "$filename.txt"
    python3 get_split_time.py "$filename.txt" | xargs -I{} ffmpeg -y -i "../../Japanese/j2-audio-wav/$filename" -t {} "../../Japanese/j2-audio-cut/$filename"
done