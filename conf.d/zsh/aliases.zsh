#!/bin/sh

# Core Aliases
alias sozsh='source ~/.config/zsh/.zshrc'
alias rm='rm -iv'
alias mkdir='mkdir -pv'
alias ps='ps auxf'
alias ping='ping -c 5'
alias less='less -R'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias bd='cd "$OLDPWD"' # cd to the previous directory
alias nv='nvim'
alias vim='vim -i NONE'
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias wget='wget2'

# Extanded Aliases
# alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
alias py='python3'
alias ls='lsd -lAh'
alias lg='lazygit'
alias lzd='lazydocker'
alias conda='micromamba'
alias CA='conda activate'
alias CD='conda deactivate'
alias tb='tensorboard --logdir'
alias fzz='zoxide query | fzf'
alias fzp='cat /etc/services | fzf'
alias tree='tree -CAF --dirsfirst'
alias treed='tree -CAFd'
alias cargobin='cargo binstall --no-discover-github-token -y'
alias z='zi' # map z to zoxide interactive selection
alias yz='yazi'

# Nix Aliases
alias nixup='cd $HOME/.config/home-manager && nix flake update && home-manager switch --impure && cd "$OLDPWD"'
alias nixclean='nix-collect-garbage -d && nix-env --delete-generations old && nix-store --gc && nix-store --optimise'
alias nixsearch='nix search nixpkgs'

# Docker Aliases
alias docker_restart='docker compose down --remove-orphans && docker compose up -d'

# Network Aliases
alias openports='netstat -nape --inet' # show open ports
alias lsof4="lsof -Pni4 | awk '{printf \"%10s %6s %5s %4s %-20s\n\", \$1, \$2, \$3, \$8, \$9}' | fzf --header-lines=1 --cycle"

# Archive Aliases
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Docker Aliases - All Docker commands start with "d" AND Docker Compose commands start with "dc"
alias dstop='docker stop $(sudo docker ps -a -q)' # usage: dstop container_name
alias dstopall='docker stop $(sudo docker ps -aq)' # stop all containers
alias drm='docker rm $(sudo docker ps -a -q)' # usage: drm container_name
alias dprunevol='docker volume prune' # remove unused volumes
alias dprunesys='docker system prune -a' # remove unsed docker data
alias ddelimages='docker rmi $(sudo docker images -q)' # remove unused docker images
alias derase='dstopcont ; drmcont ; ddelimages ; dvolprune ; dsysprune' # WARNING: removes everything!
alias dprune='ddelimages ; dprunevol ; dprunesys' # remove unused data, volumes, and images (perfect for safe clean up)
alias dexec='docker exec -ti' # usage: dexec container_name (to access container terminal)
alias dps='docker ps -a' # running docker processes
alias dpss='docker ps -a --format "table {{.Names}}\t{{.State}}\t{{.Status}}\t{{.Image}}" | (sed -u 1q; sort)' # running docker processes as nicer table
alias ddf='docker system df' # docker data usage (/var/lib/docker)
alias dlogs='docker logs -tf --tail="50" ' # usage: dlogs container_name

alias dcrun='docker compose -f ./docker-compose.yml'
alias dclogs='dcrun logs -tf --tail="50" ' # usage: dclogs container_name
alias dcup='dcrun up -d --build --remove-orphans' # up the stack
alias dcdown='dcrun down --remove-orphans' # down the stack
alias dcrec='dcrun up -d --force-recreate --remove-orphans' # usage: dcrec container_name
alias dcstop='dcrun stop' # usage: dcstop container_name
alias dcrestart='dcrun restart ' # usage: dcrestart container_name
alias dcstart='dcrun start ' # usage: dcstart container_name
alias dcpull='dcrun pull' # usage: dcpull to pull all new images or dcpull container_name


# vim: set ft=sh :
