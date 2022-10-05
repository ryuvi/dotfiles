if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias cl "clear; exa -a"
alias ls "exa -T -L2"
alias upgrade "doas pacman -Syyuu"
alias inst "doas pacman -S"
alias remove "doas pacman -R"
