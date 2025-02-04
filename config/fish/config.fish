set fish_greeting ""
bind \ct kill-word

function fish_prompt
    if set -q NNNLVL
        echo -n '(nnn) '
    end
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal
    echo -n ' % '
end

function inst
    sudo apt update
    sudo apt install $argv
end

function update
    sudo apt update
end

function upgrade
    sudo apt update
    sudo apt upgrade
end

function upgrade-all
    sudo apt update
    sudo apt upgrade
    sudo snap refresh
    sudo fwupdmgr update
end

function vimu
    pip install -U pynvim
    vim +PlugUpdate +TSUpdate
    cd ~/.vim/plugged/YouCompleteMe
    python3 install.py --clang-completer --rust-completer
    cd -
end

function dlaudio
    yt-dlp -f bestaudio --extract-audio --audio-format mp3 $argv
end

function pyserve
    python3 -m http.server $argv --bind 127.0.0.1
end

function pyserver
    python3 -m http.server 1234 --bind 127.0.0.1
end

function mdfind
    find ~/ -type f | fzf --bind "enter:execute(xdg-open {})" -q "$argv"
end

function daemon
    eval $argv > /dev/null 2>&1 &
end

function rand
    gpg --gen-random --armor 1 30
end

alias cdy "pwd | xclip -i"
alias cdp "cd (xclip -o)"

alias rrr "ranger"
alias nnn "nnn -e"
alias open "xdg-open"
alias R "R --no-save --no-restore --quiet"
alias rust "evcxr"

# Snaps ugh :(
export PATH="/snap/bin:$PATH"

# Pyright, bat
export PATH="$HOME/.local/bin:$PATH"

# Setup NNN plugins
export NNN_PLUG='c:fzcd;o:fzopen;l:launch;n:!nautilus --browser "$nnn"*;h:-!hx "$nnn"*;v:!vim "$nnn"*;d:!cp -rv "$nnn" "$nnn".copy;'

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
export CARGO="$HOME/.cargo/bin/cargo"

# Haskell
export PATH="$PATH:$HOME/.cabal/bin"
export PATH="$PATH:$HOME/.ghcup/bin"

