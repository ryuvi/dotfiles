#!/usr/bin/env bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

screens=$(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f6)

if [[ $(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f4 | cut -d"+" -f2- | uniq | wc -l) == 1 ]]; then
    MONITOR=$(polybar --list-monitors | cut -d":" -f1) TRAY_POS=right ./launch.sh --hack &
else
    primary=$(xrandr --query | grep primary | cut -d" " -f1)

    for m in $screens; do
        if [[ $primary == $m ]]; then
            MONITOR=$m TRAY_POS=left ./launch.sh --hack &
        else
            MONITOR=$m TRAY_POS=none ./launch.sh --hack &
        fi
    done
fi
