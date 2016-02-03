### Set Prompt
PS1='\W \$ '

### Git Config
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true

### promtp config
export PS1='\[\e[0;35m\][\W$(__git_ps1)] \$ \[\e[00m\]'

### bash
alias br='source ~/.bash_profile'
alias be='vim ~/.bash_profile'

function mkcd {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}
