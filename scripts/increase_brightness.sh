#!/bin/sh
CUR=$(cat /sys/class/backlight/intel_backlight/brightness)
echo $(($CUR+50)) > /sys/class/backlight/intel_backlight/brightness