#!/usr/bin/env fish
if not set -q TMUX
    tmux attach -d || tmux new -s main
end
