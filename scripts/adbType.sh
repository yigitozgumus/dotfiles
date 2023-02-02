#!/bin/bash
local message=$(echo "$@" | sed 's/ /%s/g')
adb shell input text ${message}
