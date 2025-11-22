###############
# Definitions #
###############

z_lucid() {
    zinit ice lucid "$@"
}
zi0a() {
    z_lucid wait'0a' "$@"
}

zi0b() {
    z_lucid wait'0b' "$@"
}

zi0c() {
    z_lucid wait'0c' "$@"
}

zi_program() {
    zi0a as'program' "$@"
}

###########
# Plugins #
###########

if ([ "${TERM##*-}" = '256color' ] || [ "${terminfo[colors]:?}" -gt 255 ]); then
    z_lucid depth=1
    zinit light romkatv/powerlevel10k
fi

zinit light-mode for \
        OMZL::git.zsh \
  atload"unalias grv" \
        OMZP::git
    
zinit wait lucid for \
  atinit"zicompinit; zicdreplay"  \
        zdharma-continuum/fast-syntax-highlighting \
      OMZP::colored-man-pages \
# as"completion" \
#        OMZP::docker/_docker

zi0c has'fzf' ''
zinit light ZoeFiri/fz

zi0a blockf atload'_zsh_autosuggest_start'
zinit load zsh-users/zsh-autosuggestions

zi0a
zinit light Tarrasch/zsh-autoenv

# zi0a src'asdf.sh' mv'completions/_asdf -> .'
# zinit light asdf-vm/asdf

zinit wait'0b' lucid for \
    OMZL::clipboard.zsh \
    OMZL::compfix.zsh \
    OMZL::completion.zsh \
    OMZL::correction.zsh \
    atload"
        alias ..='cd ..'
        alias ...='cd ../..'
        alias ....='cd ../../..'
        alias .....='cd ../../../..'
    " \
    OMZL::directories.zsh \
    OMZL::git.zsh \
    OMZL::grep.zsh \
    OMZL::history.zsh \
    OMZL::key-bindings.zsh \
    OMZL::spectrum.zsh \
    OMZL::termsupport.zsh \
    OMZL::functions.zsh \
    atload"
        alias gcd='gco dev'
    " \
    OMZP::git \
    OMZP::fzf \
    OMZP::dotenv

zinit ice wait'0' lucid depth=1 \
    atload"autoload -Uz compinit && compinit -u" \
    atpull"zinit cclear && zinit creinstall sainnhe/zsh-completions"
zinit light sainnhe/zsh-completions

zinit wait lucid for \
    light-mode atinit"ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20" atload"!_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    light-mode atinit"typeset -gA FAST_HIGHLIGHT; FAST_HIGHLIGHT[git-cmsg-len]=100; zpcompinit; zpcdreplay" \
        zdharma-continuum/fast-syntax-highlighting \
    light-mode blockf atpull'zinit creinstall -q .' \
    atinit"
        zstyle ':completion:*' completer _expand _complete _ignored _approximate
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
        zstyle ':completion:*' menu select=2
        zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
        zstyle ':completion:*:descriptions' format '-- %d --'
        zstyle ':completion:*:processes' command 'ps -au$USER'
        zstyle ':completion:complete:*:options' sort false
        zstyle ':fzf-tab:complete:_zlua:*' query-string input
        zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm,cmd -w -w'
        zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
        zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'exa -1 --color=always ${~ctxt[hpre]}$in'
    " \
        zsh-users/zsh-completions \
    bindmap"^R -> ^H" atinit"
        zstyle :history-search-multi-word page-size 10
        zstyle :history-search-multi-word highlight-color fg=red,bold
        zstyle :plugin:history-search-multi-word reset-prompt-protect 1
    " \
        zdharma-continuum/history-search-multi-word \
    reset \
    atclone"local P=${${(M)OSTYPE:#*darwin*}:+g}
            \${P}sed -i \
            '/DIR/c\DIR 38;5;63;1' LS_COLORS; \
            \${P}dircolors -b LS_COLORS > c.zsh" \
    atpull'%atclone' pick"c.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”' \
        trapd00r/LS_COLORS

export LS_COLORS="$LS_COLORS:ow=1;34;105:tw=1;34:"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} 
