#!/usr/bin/env bash

# PhpStorm Debug URL Handler
# ide://open?url=file://@file&line=@line
#
# @license NONE
# @author Pitonn

arg=${1}
pattern=".*file:\/\/(.*)&line=(.*)"
# echo arg = $arg

# Get the file path.
file=$(echo "${arg}" | sed -r "s/${pattern}/\1/")
# echo file = $file

# Get the line number.
line=$(echo "${arg}" | sed -r "s/${pattern}/\2/")
# echo line = $line

# Check if phpstorm|pstorm command exist.
if type phpstorm > /dev/null;
	then
		# echo 'test = ' $
    	/usr/bin/env phpstorm --line "${line}" "${file}"
elif type pstorm > /dev/null;
	then
		# echo 'right'
    	/usr/bin/env pstorm --line "${line}" "${file}"
fi
