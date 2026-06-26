if status is-interactive
	alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
end

function fish_greeting
end

bind alt-backspace backward-kill-path-component
