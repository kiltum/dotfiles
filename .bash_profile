# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";
export PATH="${PATH}:${HOME}/.krew/bin"
export PATH="${PATH}:${HOME}/.local/bin"
export PATH="${PATH}:/Applications/ARM/bin/"
if [[ "$(uname -m)" == "arm64" ]]; then
  export PATH="/opt/homebrew/bin:${PATH}"
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.bash.inc' ]; then source '$HOME/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.bash.inc' ]; then source '$HOME/google-cloud-sdk/completion.bash.inc'; fi

if [ -f '/usr/local/bin/aws_completer' ]; then complete -C '/usr/local/bin/aws_completer' aws ; fi

# Set the default kube context if present
DEFAULT_KUBE_CONTEXTS="$HOME/.kube/config"
if test -f "${DEFAULT_KUBE_CONTEXTS}"
then
  export KUBECONFIG="$DEFAULT_KUBE_CONTEXTS"
fi

# https://nikgrozev.com/2019/10/03/switch-between-multiple-kubernetes-clusters-with-ease/
# https://github.com/ahmetb/kubectx
# Additional contexts should be in ~/.kube/custom-contexts/ 
CUSTOM_KUBE_CONTEXTS="$HOME/.kube/custom-contexts"
mkdir -p "${CUSTOM_KUBE_CONTEXTS}"

OIFS="$IFS"
IFS=$'\n'
for contextFile in `find "${CUSTOM_KUBE_CONTEXTS}" -type f -name "*.yml"`  
do
    export KUBECONFIG="$contextFile:$KUBECONFIG"
done
IFS="$OIFS"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

#/usr/bin/keychain -q --nogui $HOME/.ssh/id_rsa
#source $HOME/.keychain/$HOSTNAME-sh

if [ -z "$(pgrep ssh-agent)" ]; then
   rm -rf /tmp/ssh-*
   eval $(ssh-agent -s) > /dev/null
else
   export SSH_AGENT_PID=$(pgrep ssh-agent)
   export SSH_AUTH_SOCK=$(find /tmp/ssh-* -name agent.*)
fi

ssh-add -l &>/dev/null
if [ $? -ne 0 ]; then
        echo "Need ssh key password"
    ssh-add
fi

function title()
{
   # change the title of the current window or tab
   echo -ne "\033]0;$*\007"
}

function ssh()
{
   /usr/bin/ssh "$@"
   # revert the window title after the ssh command
   title $USER@${HOSTNAME,,}
}

function su()
{
   /bin/su "$@"
   # revert the window title after the su command
   title $USER@${HOSTNAME,,}
}

function mc()
{
   /usr/bin/mc "$@"
   # revert the window title after the su command
   title $USER@${HOSTNAME,,}
}

title $USER@${HOSTNAME,,}
cd
GPG_TTY=$(tty)
export GPG_TTY
