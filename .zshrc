autoload -Uz compinit
compinit

PATH=$PATH:/Applications/Wireshark.app/Contents/MacOS
PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
source "$HOME/.rye/env"

# goenv
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"
export PATH="$PATH:$(go env GOPATH)/bin"

# kubectl
source <(kubectl completion zsh)

# uv
. "$HOME/.local/bin/env"
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# Added by Antigravity
export PATH="/Users/misumiakihisa/.antigravity/antigravity/bin:$PATH"


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

# zinit plugins
zinit light zsh-users/zsh-autosuggestions  # コマンド補完サジェスト
zinit light zsh-users/zsh-syntax-highlighting  # シンタックスハイライト
zinit light zsh-users/zsh-completions  # 補完強化
zinit light Aloxaf/fzf-tab  # Tab補完にfzf統合
export ZENO_HOME=~/.config/zeno
zinit ice lucid depth"1"
zinit light yuki-yano/zeno.zsh  # abbreviation展開
### End of Zinit's installer chunk
if [[ -n $ZENO_LOADED ]]; then
  # ここに任意のZLEの記述を行う
  bindkey ' '  zeno-auto-snippet
  bindkey '^m' zeno-auto-snippet-and-accept-line
  bindkey '^i' zeno-completion
  bindkey '^g' zeno-ghq-cd
  bindkey '^r' zeno-history-selection
  bindkey '^x' zeno-insert-snippet
fi

# プロンプト：starship
eval "$(starship init zsh)"

# zoxide (cd強化)
eval "$(zoxide init zsh)"

# fzf
source <(fzf --zsh)


# 履歴設定
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY  # 複数ターミナルで履歴共有
setopt HIST_IGNORE_DUPS  # 重複履歴を記録しない
setopt HIST_IGNORE_SPACE  # スペース始まりは記録しない

# 補完
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-lit 'm:{a-z}={A-Z}'  # 大文字小文字を区別しない
