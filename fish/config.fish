set fish_greeting

function fish_prompt
    string join '' -- (set_color green) (prompt_pwd) (set_color normal) ' △  '
end

set -Ux CC clang
set -Ux CXX clang++

alias gcsd "git clone --depth=1"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
