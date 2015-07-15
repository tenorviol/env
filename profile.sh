# get the current env root regardless of symlink or whatever
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
envRoot=$( cd -P "$( dirname "$SOURCE" )" && pwd )

export PATH=$PATH:$envRoot/bin
export HISTCONTROL=erasedups
export HISTFILESIZE=5000

alias ll='ls -l'
alias lla='ls -la'

# git branch in prompt
function prompt_prefix {
  cat "$envRoot/prompt"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}
PS1="\$(prompt_prefix):\W\$(parse_git_branch) \u\$ "
