# SSH Agent !!!
set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
if not ssh-add -l >/dev/null 2>&1
    ssh-add ~/.ssh/id_ed25519_bs >/dev/null 2>&1
    ssh-add ~/.ssh/id_ed25519-the-simen >/dev/null 2>&1
end
