#!/bin/bash
# @jirateep12

VIDEO_ID=$1

[ -z "$VIDEO_ID" ] && echo "ERROR: No video id specified" && exit 1

read -n2 -p "Do you want options? (v|a|uv|ua) : " id
case $id in  
  (v|V) yt-dlp --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best" "https://www.youtube.com/watch?v=$VIDEO_ID" -o "~\Documents\%(id)s.%(ext)s";; 
  (a|A) yt-dlp -f "bestaudio[ext=m4a]/best" "https://www.youtube.com/watch?v=$VIDEO_ID" -o "~\Documents\%(id)s.%(ext)s";;
  (uv|UV)
    printf "\n"
    yt-dlp --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best" $VIDEO_ID -o "~\Documents\%(id)s.%(ext)s"
    ;;
  (uA|UA)
    printf "\n"
    yt-dlp -f "bestaudio[ext=m4a]/best" $VIDEO_ID -o "~\Documents\%(id)s.%(ext)s"
    ;;
esac
