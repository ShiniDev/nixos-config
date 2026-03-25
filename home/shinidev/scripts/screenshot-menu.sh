#!/usr/bin/env bash

save_dir="$HOME/Pictures"
filename="$save_dir/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"
mkdir -p "$save_dir"

options="1. Whole Screen to File\n2. Specified Area to File\n3. Whole Screen to Clipboard\n4. Specified Area to Clipboard"
choice=$(echo -e "$options" | wofi --show dmenu --prompt "Screenshot:" --width 300 --lines 4)

case "$choice" in
    "1. Whole Screen to File")
        sleep 0.2
        grim "$filename"
        ;;
    "2. Specified Area to File")
        sleep 0.2
        grim -g "$(slurp)" "$filename"
        ;;
    "3. Whole Screen to Clipboard")
        sleep 0.2
        grim - | wl-copy
        ;;
    "4. Specified Area to Clipboard")
        sleep 0.2
        grim -g "$(slurp)" - | wl-copy
        ;;
esac