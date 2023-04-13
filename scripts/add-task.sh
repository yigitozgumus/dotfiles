#!/bin/bash
read -p "Task: " taskContent
read -p "Due: " dueTime
projectName=$(task _projects | fzf --reverse)
task add $taskContent project:$projectName due:$dueTime
