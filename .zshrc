if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p $HOME/.zinit
    command git clone https://github.com/zdharma/zinit $HOME/.zinit/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# THEME             #
zinit ice depth=1; zinit light romkatv/powerlevel10k

#####################
# PLUGINS           #
#####################
# SSH-AGENT
zinit light bobsoppe/zsh-ssh-agent
# AUTOSUGGESTIONS, TRIGGER PRECMD HOOK UPON LOAD
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
zinit ice wait"0a" lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions
# ENHANCD
zinit ice wait"0b" lucid
zinit light b4b4r07/enhancd
export ENHANCD_FILTER=fzf:fzy:peco
# HISTORY SUBSTRING SEARCHING
zinit ice wait"0b" lucid atload'bindkey "$terminfo[kcuu1]" history-substring-search-up; bindkey "$terminfo[kcud1]" history-substring-search-down'
zinit light zsh-users/zsh-history-substring-search
# TAB COMPLETIONS
zinit ice wait"0b" lucid blockf
zinit light zsh-users/zsh-completions
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '-- %d --'
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:complete:*:options' sort false
zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# FZF
zinit ice from"gh-r" as"command"
zinit light junegunn/fzf
# FZF BYNARY AND TMUX HELPER SCRIPT
zinit ice lucid wait'0c' as"command" id-as"junegunn/fzf-tmux" pick"bin/fzf-tmux"
zinit light junegunn/fzf
# BIND MULTIPLE WIDGETS USING FZF
zinit ice lucid wait'0c' multisrc"shell/{completion,key-bindings}.zsh" id-as"junegunn/fzf_completions" pick"/dev/null"
zinit light junegunn/fzf
# FZF-TAB
zinit ice wait"1" lucid
zinit light Aloxaf/fzf-tab
# SYNTAX HIGHLIGHTING
zinit ice wait"0c" lucid atinit"zpcompinit;zpcdreplay"
zinit light zdharma/fast-syntax-highlighting
# NVM
export NVM_AUTO_USE=true
zinit ice wait"1" lucid
zinit light lukechilds/zsh-nvm
# EXA
zinit ice wait"2" lucid from"gh-r" as"program" mv"exa* -> exa"
zinit light ogham/exa
zinit ice wait blockf atpull'zinit creinstall -q .'
# DELTA
zinit ice lucid wait"0" as"program" from"gh-r" pick"delta*/delta"
zinit light 'dandavison/delta'
# BAT
zinit ice from"gh-r" as"program" mv"bat* -> bat" pick"bat/bat" atload"alias cat=bat"
zinit light sharkdp/bat
# BAT-EXTRAS
zinit ice wait"1" as"program" pick"src/batgrep.sh" lucid
zinit ice wait"1" as"program" pick"src/batdiff.sh" lucid
zinit light eth-p/bat-extras
# RIPGREP
zinit ice from"gh-r" as"program" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
zinit light BurntSushi/ripgrep
# NEOVIM
zinit ice from"gh-r" as"program" bpick"*appimage*" ver"nightly" mv"nvim* -> nvim" pick"nvim"
zinit light neovim/neovim
# FORGIT
zinit ice wait lucid
zinit load 'wfxr/forgit'
# LAZYGIT
zinit ice lucid wait"0" as"program" from"gh-r" mv"lazygit* -> lazygit" atload"alias lg='lazygit'"
zinit light 'jesseduffield/lazygit'
# LAZYDOCKER
zinit ice lucid wait"0" as"program" from"gh-r" mv"lazydocker* -> lazydocker" atload"alias lg='lazydocker'"
zinit light 'jesseduffield/lazydocker'
# RANGER
zinit ice depth'1' as"program" pick"ranger.py"
zinit light ranger/ranger
# FD
zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd
# GH-CLI
zinit ice lucid wait"0" as"program" from"gh-r" pick"usr/bin/gh"
zinit light "cli/cli"
# TMUX
zinit ice from"gh-r" as"program" mv"tmux* -> tmux" pick"tmux" atload"alias tmux=tmux"
zinit light tmux/tmux
# BIT
zinit ice lucid wait"0" as"program" from"gh-r" pick"bit"
zinit light "chriswalz/bit"
# ZSH MANYDOTS MAGIC
zinit autoload'#manydots-magic' for knu/zsh-manydots-magic
# TREE-SITTER
zinit ice as"program" from"gh-r" mv"tree* -> tree-sitter" pick"tree-sitter"
zinit light tree-sitter/tree-sitter
# XURLS
zinit ice as"program" from"gh-r" mv"xurls* -> xurls" pick"xurls"
zinit light mvdan/xurls
# PRETTYPING
zinit ice lucid wait'' as"program" pick"prettyping" atload'alias ping=prettyping'
zinit load "denilsonsa/prettyping"
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zhistory"
HISTSIZE=290000
SAVEHIST=$HISTSIZE

#####################
# SETOPT            #
#####################
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt hash_list_all          # hash everything before completion
# setopt completealiases        # complete alisases
setopt always_to_end          # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word       # allow completion from within a word/phrase
setopt nocorrect                # spelling correction for commands
setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.
setopt nolisttypes
setopt listpacked
setopt automenu
unsetopt BEEP
setopt vi

export EDITOR='vim'
export VISUAL=$EDITOR
export PAGER='less'
export SHELL='/bin/zsh'
export BAT_THEME="gruvbox-dark"
if [[ ! $(tmux ls) ]] 2> /dev/null; then 
  tmux new -s λ
fi
# COLORING          #
autoload colors && colors

alias clc=clear

export PATH=$PATH:/usr/local/go/bin:~/.local/bin:~/bin
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
export TF_LOG=TRACE
export TF_LOG_PATH=/home/ubersholder/terraform/DB+EC2+ASG/uber.log
export TF_VAR_db_username=terraform
export TF_VAR_db_password=terraform
