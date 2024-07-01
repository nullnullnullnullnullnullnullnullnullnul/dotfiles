#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

export EDITOR='nvim'
export VISUAL='nvim'

# ALIASES
alias cat="bat"
alias ll="ls -la"
alias streamlink="nohup streamlink"
alias myip="curl ipinfo.io/ip"
alias ls='ls --color=auto'
alias mkdir="mkdir -p"
alias vi="nvim"
alias mount="mount | column -t"
alias ping="ping -c 5"
alias mv="mv -i"
alias cp="cp -i"
alias ln="ln -i"
alias wget="wget -c"
alias grep='grep --color=auto'
alias ..="cd .."
alias neofetch="fastfetch"
alias bat-status='sudo tlp-stat -b'
alias bat-full='sudo tlp setcharge 0 99 BAT0'
alias bat-reserve='sudo tlp setcharge 75 80 BAT0'

pdf() {
  pdftotext "$1" - | less
}

sudo() {
    if [ "$1" = "nvim" ]; then
        command sudoedit "${@:2}"
    else
        command sudo "$@"
    fi
}

run() {
  if [[ "$1" == *.c ]]; then
    output="${1%.c}"
    log_file="$output.log"
    command gcc -O -Wall -W -pedantic -ansi -std=c99 -o "$output" "$1" &> "$log_file" && "./$output"
    cat "$log_file"
    rm "$log_file"
  else
    echo "Error: File needs to be .c"
  fi
}
