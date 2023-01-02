#!/bin/bash

QTT_MONITORS=$(xrandr --listactivemonitors | grep Monitors | grep -o "[0-9]")

if [[ $QTT_MONITORS == "2" ]]; then
	xrandr --output HDMI1 --left-of eDP1 --auto
  #xrandr --output eDP1 --right-of HDMI1 --auto
else
	xrandr --output eDP1 --auto
fi

feh --bg-fill "$HOME/Pictures/4k-minimalist-meteor-shower-02bb7nh3560jiewq.jpg"
