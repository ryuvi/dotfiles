if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias cl "clear; exa -a"
alias ls "exa -T -L2"
alias upgrade "doas pacman -Syyuu"
alias inst "doas pacman -S"
alias remove "doas pacman -R"
alias v "nvim"
alias gi "git init"
alias gc "git commit -m"
alias ga "git add"
alias gp "git push -u origin main"
alias gb "git branch"
alias gchange "git checkout"
alias py "python3"
alias pi "pip3"
alias vfish "vim ~/.config/fish/config.fish"
alias del "rm -rf"

