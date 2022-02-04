clear
ZSH_DISABLE_COMPFIX=true
ZSH_THEME="osx"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting bgnotify)

PATH="$PREFIX/bin:$HOME/.local/bin:$PATH"
export PATH

export TERM=xterm-256color 

source $HOME/.oh-my-zsh/oh-my-zsh.sh
source $HOME/.config/lf/icons
source $HOME/.aliases
source $HOME/.autostart
