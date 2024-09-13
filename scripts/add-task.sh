#!/bin/bash
read -p "Task: " taskContent
current="${taskContent}"
read -p "Due: " dueTime
if [ "$dueTime" != "" ]; then
	current="${current} due:${dueTime}"
fi
read -p "Tags: " tags
if [ "$tags" != "" ]; then
	current="${current} tag:${tags}"
fi

read -p "Project: " project
if [ "$project" != "" ]; then
	current="${current} project:${project}"
fi

task add $current
