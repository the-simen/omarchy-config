set -gx PATH /usr/bin $PATH

# SSH Agent !!!
set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
if not ssh-add -l >/dev/null 2>&1
    ssh-add ~/.ssh/id_ed25519_bs >/dev/null 2>&1
    ssh-add ~/.ssh/id_ed25519-the-simen >/dev/null 2>&1
end

function fish_user_key_bindings
    fish_vi_key_bindings

    bind -M insert \cy 'commandline -f accept-autosuggestion'
    bind -M insert -m default jj backward-char force-repaint
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
    # if not set -q TMUX
    #     tmux attach || tmux new -s main
    # end

    fastfetch
    set fish_greeting

    if set -q TMUX
        # Используем tmux-окружение как флаг
        if not tmux show-environment -g TMUX_CONF_LOADED >/dev/null 2>&1
            tmux source-file ~/.tmux.conf
            tmux set-environment -g TMUX_CONF_LOADED 1
        end
    end
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
alias n.='nvim .'
alias v='nvim'
alias v.='nvim .'
alias f='yazi'


# function fish_prompt
#   set_color cyan; echo (pwd)
#   set_color green; echo '> '
# end
#

starship init fish | source
enable_transience
