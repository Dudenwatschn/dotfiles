function tmuxopen
	tmux attach -t $argv
if test $status != 0
tmux new-session -t $argv
end
end
