# auto-convert case
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
# error correction
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric compinit -d "$ZSH_COMPDUMP"

# fzf-tab

# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# pistol mime preview
zstyle ':fzf-tab:*' fzf-preview 'pistol ${(Q)realpath}'
zstyle ':fzf-tab:*' fzf-flags --height 60%
zstyle ':fzf-tab:*' fzf-pad 4
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
zstyle ':fzf-tab:*' accept-line enter

# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
	'[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --header="[process ID]" --preview-window=down:3:wrap

# show systemd unit status
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# show environment variable
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
	fzf-preview 'echo ${(P)word}'

# show alias
zstyle ':fzf-tab:complete:alias:*' fzf-preview 'alias $word'

# show command manual
zstyle ':fzf-tab:complete:-command-:*' fzf-preview \
	'(out=$(tldr --color always "$word") 2>/dev/null && echo $out) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word") 2>/dev/null && echo $out) || (out=$(which "$word") && echo $out) || echo "${(P)word}"'

# man or help
zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# ssh
## remove all previous ssh hosts
compdef -d ssh
## define new ssh hosts
function _ssh_hosts() {
	compadd $(rg -x --no-line-number 'Host\ .*' ~/.ssh/config | sed -E 's/Host\ //' | cat)
}
compdef _ssh_hosts ssh
zstyle ':fzf-tab:complete:ssh:*' fzf-preview 'sshconfig_preview $word'
