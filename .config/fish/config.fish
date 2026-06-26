if status is-interactive
end

function config
	/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
end

function fish_greeting
end

bind alt-backspace backward-kill-path-component
