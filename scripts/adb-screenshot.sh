#!/bin/bash

screenshot_output_file="$HOME/Desktop/screen_$(date +%Y_%m_%d_%H_%M_%S).png"

adb shell screencap -p /sdcard/screen.png
adb pull /sdcard/screen.png $screenshot_output_file
adb shell rm /sdcard/screen.png

echo Saved to: $screenshot_output_file
