export PATH="$HOME/.cargo/bin:$PATH"

set -gx EDITOR vim

alias v="nvim"

function fish_prompt
    echo -n (whoami): (prompt_pwd) (fish_vcs_prompt) '$ '
end
