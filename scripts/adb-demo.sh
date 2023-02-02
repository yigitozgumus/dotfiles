#!/bin/sh

# source: https://android.jlelse.eu/clean-your-status-bar-like-a-pro-76c89a1e2c2f
# Add these aliases to your `~/.profile`
# alias demoOn='sh /Users/$(whoami)/scripts/adb-demo.sh on'
# alias demoOff='sh /Users/$(whoami)/scripts/adb-demo.sh off'

CMD=$1

if [[ $CMD != "on" && $CMD != "off" ]]; then
	echo "Usage: $0 [on|off]" >&2
	exit
fi

adb shell settings put global sysui_demo_allowed 1

if [ $CMD == "on" ]; then
	# display time 11:10
	adb shell am broadcast -a com.android.systemui.demo -e command clock -e hhmm 1110

	# Display full mobile data without type
	adb shell am broadcast -a com.android.systemui.demo -e command network -e mobile show -e level 4 -e datatype false

	# Hide notifications
	adb shell am broadcast -a com.android.systemui.demo -e command notifications -e visible false

	# Show full battery but not in charging state
	adb shell am broadcast -a com.android.systemui.demo -e command battery -e plugged false -e level 100
elif [ $CMD == "off" ]; then
	adb shell am broadcast -a com.android.systemui.demo -e command exit
fi
