# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="alacritty"

setopt HIST_IGNORE_SPACE
export PATH=$HOME/bin/:$PATH
export PATH=/usr/local/bin/:$PATH
export PATH=/snap/bin/:$PATH

export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
export PATH=/usr/local/lib/node_modules/:$PATH
export PATH=$HOME/.local/bin/:$PATH
export PATH=$HOME/intelFPGA_lite/20.1/quartus/bin/:$PATH
export PATH=$HOME/scripts:$PATH
export PATH=/opt/microchip/xc8/v2.40/bin:/opt/microchip/xc8/v2.40/pic/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/matlab/bin:$PATH

export EDITOR="kak"
export VISUAL="kak"
export PAGER="bat"
export NNN_OPTS="eH"

export IDF_ROOT_PATH=$HOME/esp-idf
export IDF_PATH=$IDF_ROOT_PATH
export IDF_WORKTREES=$HOME/wokrtrees

export GPG_TTY=$(tty)

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

# Enable completion for switch_idf

autoload -Uz compinit
compinit
compdef _switch_idf_complete switch_idf

# Load aditional config

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
# alias fd=fdfind # not needed on arch
alias enable_ccache="export IDF_CCACHE_ENABLE=1"
alias get_idf='enable_ccache && . $IDF_PATH/export.sh'
alias get_scripts='export PATH=$HOME/scripts:$PATH && echo \"Scripts loaded.\'
alias install_idf='enable_ccache && $IDF_PATH/install.sh --enable-pytest --enable-ci al'
alias update_idf='enable_ccache && cd $IDF_PATH && git -C $IDF_PATH pull && git -C $IDF_PATH submodule update --init --recursive && install_id'
alias load_idf='install_idf && get_idf && echo \"IDF loaded.\'
alias ls="ls --color=always"
alias pip=pip3
alias hibernate="sudo systemctl hibernate"
alias t="todo.sh -d $HOME/.config/todo.txt/config"
alias incognito=" unset HISTFILE"
alias vim="nvim"
alias ip="ip -c"
alias lock="loginctl lock-session"
alias mc-read="matrix-commander --listen-self --tail -s .config/matrix-commander/store"
alias haberun="export HOME=$HOME/.profiles/haberun; discord;"
alias matlab="LD_PRELOAD=\"/usr/lib/libstdc++.so.6\" matlab"

#####################
# Utils             #
#####################

switch_idf() {
    local branch=$1

    # If the branch is "master", set IDF_PATH to IDF_ROOT_PATH
    if [[ "$branch" == "master" ]]; then
        export IDF_PATH="$IDF_ROOT_PATH"
        echo "Branch is 'master'. IDF_PATH set to $IDF_PATH."
        return
    fi

    local safe_branch=${branch//\//__}  # Replace / with __ for filesystem-safe directory name
    local worktree_dir="$IDF_WORKTREES/$safe_branch"

    # Check if the worktree already exists
    if git -C "$IDF_ROOT_PATH" worktree list | grep -q "$worktree_dir"; then
        # Set IDF_PATH to the existing worktree location
        export IDF_PATH="$worktree_dir"
        echo "Worktree for branch '$branch' already exists. IDF_PATH set to $IDF_PATH."
    else
        # Create a new worktree for the branch in the specified location
        git -C "$IDF_ROOT_PATH" worktree add "$worktree_dir" "$branch"
        export IDF_PATH="$worktree_dir"
        echo "Created new worktree for branch '$branch'. IDF_PATH set to $IDF_PATH."

        # Get the list of submodule paths from the output of `git submodule status --recursive`
        local submodule_paths
        submodule_paths=$(git -C "$worktree_dir" submodule status --recursive | awk '{print $2}')

        # Loop over each submodule path and perform a shallow clone using --reference
        (
            trap 'kill 0' SIGINT
            echo "$submodule_paths" | while IFS= read -r submodule_path; do
            # for submodule_path in $submodule_paths; do
                echo "Updating: $submodule_path"
                local reference_path="$IDF_ROOT_PATH/$submodule_path"
                git -C "$worktree_dir" submodule update --init --depth 1 --reference "$reference_path" --dissociate -- "$submodule_path"
            done
            wait
        )
        echo "Submodules initialized and updated with shallow clone."
    fi
}

# Completion for switch_idf
_switch_idf_complete() {
  local branches
  branches=($(git -C "$IDF_ROOT_PATH" for-each-ref --format='%(refname:short)' refs/heads refs/remotes))
  _describe 'branch' branches
}

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

# PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
eval "$__conda_setup"
else
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export SHELL_COMMON=$HOME/.config/shell

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $SHELL_COMMON/zsh/p10k.zsh ]] || source $SHELL_COMMON/zsh/p10k.zsh

export IN_ZINIT=1
. "$SHELL_COMMON/zsh/zinit.zsh"

# To customize prompt, run `p10k configure` or edit ~/.config/shell/zsh/p10k.zsh.
[[ ! -f ~/.config/shell/zsh/p10k.zsh ]] || source ~/.config/shell/zsh/p10k.zsh

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

if [ -f /usr/share/nnn/quitcd/quitcd.bash_sh_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_sh_zsh
fi

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

