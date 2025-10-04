set -gx PATH /usr/bin $PATH
set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

function fish_user_key_bindings
    fish_vi_key_bindings

    bind -M insert \cy 'commandline -f accept-autosuggestion'
end

function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    if not set -q TMUX
        tmux attach || tmux new -s main
    end

    fastfetch
    set fish_greeting

end

if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
end

alias ls='eza --icons'
alias clear="printf '\033[2J\033[3J\033[1;1H'"
alias cls="printf '\033[2J\033[3J\033[1;1H'"
alias q='qs -c ii'
alias mc='mc --nosubshell'
alias top='btop'
alias cat='bat'
alias ping='gping'
alias n='nvim'
alias f='yazi'


# function fish_prompt
#   set_color cyan; echo (pwd)
#   set_color green; echo '> '
# end
#

starship init fish | source
