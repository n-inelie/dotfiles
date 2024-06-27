set fish_greeting

function fish_prompt
    string join '' -- (set_color green) (prompt_pwd) (set_color normal) ' △  '
end

set -Ux CC clang
set -Ux CXX clang++
set -Ux CPATH $HOME/examples/c/wind/include/
set -Ux GOPATH $HOME/go
set -Ux GOROOT /usr/lib/go
set -Ux GOBIN $HOME/go/bin/

alias gcsd "git clone --depth=1"

if status is-interactive
    # Commands to run in interactive sessions can go here
end
