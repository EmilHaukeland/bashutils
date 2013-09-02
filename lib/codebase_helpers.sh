#!/bin/sh
#
# Codebase helpers
# Author: Emil Haukeland
#
alias gtouches='_touches'

function _touches() {
    local commitMessage=''

    if [ $# -eq 0 ] || [ $# -gt 3 ]; then
        echo 'Missing args'
        echo ' $1: Codebase ticket [touches: x]'
        echo ' $2: Time spent in minutes, or message (optional)'
        echo ' $3: Message. \$2 considered minutes in this case (optional)'
        return 1
    elif [ $# -eq 3 ]; then
        commitMessage="{t:$2} $3"
    elif [ $# -eq 2 ] && [ ! -z "$2" ]; then
		if grep -q "^[0-9]*$" <<< "$2"; then
        	commitMessage="{t:$2}"
		else
			commitMessage="$2"
		fi
    else
        commitMessage="$2"
    fi
	
    git commit -m "[touches: $1] $commitMessage"
}
