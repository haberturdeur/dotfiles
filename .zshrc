# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt HIST_IGNORE_SPACE
export PATH=$HOME/bin/:$PATH
export PATH=/usr/local/bin/:$PATH
export PATH=/snap/bin/:$PATH

export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
export PATH=/usr/local/lib/node_modules/:$PATH
export PATH=/home/tom/.local/bin/:$PATH
export PATH=/home/tom/intelFPGA_lite/20.1/quartus/bin/:$PATH

export EDITOR="nvim"

export IDF_PATH=$HOME/esp/esp-idf

export GPG_TTY=$(tty)

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

setopt promptsubst


#####################
# PROGRAMS          #
#####################

# A fork of `z' by rupa deadwyler with much improved zsh/bash completion and better results. The data file format and core algorithm are compatible with those of the original.
zinit wait'1' lucid light-mode for \
    pick"z.sh" \
    knu/z \
    as'command' atinit'export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"' pick"bin/n" \
    tj/n \
    from'gh-r' as'command' atinit'export PATH="$HOME/.yarn/bin:$PATH"' mv'yarn* -> yarn' pick"yarn/bin/yarn" bpick'*.tar.gz' \
    yarnpkg/yarn \


#####################
# HISTORY           #
#####################
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=99999
SAVEHIST=90000

#####################
# SETOPT            #
#####################
# set -o emacs
# setopt vi
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt always_to_end          # cursor moved to the end in full completion
setopt hash_list_all          # hash everything before completion
setopt completealiases        # complete alisases
setopt always_to_end          # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word       # allow completion from within a word/phrase
setopt nocorrect              # spelling correction for commands
setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.
setopt nolisttypes
setopt listpacked
setopt automenu
setopt auto_param_slash

#####################
# ENV VARIABLE      #
#####################
ZSH_AUTOSUGGEST_MANUAL_REBIND=1  # make prompt faster
DISABLE_MAGIC_FUNCTIONS=true     # make pasting into terminal faster
export EDITOR=nvim
export PAGER=bat
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

#####################
# ALIASES           #
#####################
alias fd=fdfind
alias get_idf=". $HOME/esp/esp-idf/export.sh"
alias open="flatpak run re.sonny.Junction"
alias ls="ls --color=always"
alias pip=pip3
alias hibernate="sudo systemctl hibernate"
alias sync-todo="rclone bisync drive-simple:.todo local:/home/tom/.todo"
alias t="todo.sh -d $HOME/.config/todo.txt/config"
alias incognito=" unset HISTFILE"
alias vim="nvim"
alias earc="echo \"connect 20:1B:88:4A:1D:69\" | bluetoothctl"
alias eard="echo \"disconnect 20:1B:88:4A:1D:69\" | bluetoothctl"
alias earcn="echo \"connect 78:35:38:B5:D7:32\" | bluetoothctl"
alias eardn="echo \"disconnect 78:35:38:B5:D7:32\" | bluetoothctl"
alias ip="ip -c"
alias lock="loginctl lock-session"
alias sync="clone bisync drive-simple:Logseq local:/home/tom/Documents/Logseq >/dev/null 2>&1"
alias prj="cd ~/Projects"
alias matrix-commander=" matrix-commander"
alias mc-read="matrix-commander --listen-self --tail"

#####################
# FZF SETTINGS      #
#####################
FD_OPTIONS="--hidden --follow"
export FZF_DEFAULT_OPTS="--prompt '⯈ ' --color=dark --layout=reverse --color=fg:250,fg+:15,hl:203,hl+:203 --color=info:100,pointer:15,marker:220,spinner:11,header:-1,gutter:-1,prompt:15"
export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTIONS || git ls-files --cached --others --exclude-standard"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
export FZF_COMPLETION_OPTS="-x"

_fzf_compgen_path() {
    fd --hidden --follow . "$1"
}
_fzf_compgen_dir() {
    fd --type d --hidden --follow . "$1"
}

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# PATH="/home/tom/perl5/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="/home/tom/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/home/tom/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/home/tom/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/home/tom/perl5"; export PERL_MM_OPT;


# >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/tom/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/tom/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/tom/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/tom/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

export SHELL_COMMON=$HOME/.config/shell

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $SHELL_COMMON/zsh/p10k.zsh ]] || source $SHELL_COMMON/zsh/p10k.zsh

export IN_ZINIT=1
. "$SHELL_COMMON/zsh/zinit.zsh"

# To customize prompt, run `p10k configure` or edit ~/.config/shell/zsh/p10k.zsh.
[[ ! -f ~/.config/shell/zsh/p10k.zsh ]] || source ~/.config/shell/zsh/p10k.zsh

[ -f "/home/tom/.ghcup/env" ] && source "/home/tom/.ghcup/env" # ghcup-env