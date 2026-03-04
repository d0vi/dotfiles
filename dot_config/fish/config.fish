fish_add_path $HOME/bin $HOME/.local/bin

set -x EDITOR /usr/bin/hx
set -x PODMAN_COMPOSE_WARNING_LOGS false
set -x TESTCONTAINERS_RYUK_DISABLED true

fzf --fish | source
mise activate fish | source
starship init fish | source

abbr -a c chezmoi
abbr -a lg lazygit
abbr -a cc claude
abbr -a hf 'fzf -m --preview="bat --color=always {}" --bind "enter:become(hx {+})"'
