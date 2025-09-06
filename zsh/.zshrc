# ~/.config/zsh/.zshrc

# Adiciona o diretório de binários do usuário ao PATH
export PATH=$HOME/.local/bin:$PATH

# Histórico de Comandos
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# Carrega e executa o starship para o prompt
eval "$(starship init zsh)"

# Carrega plugins (se você usar um gerenciador como o zplug ou Zinit)
# Por enquanto, vamos carregar manualmente
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# --- Integração do Yazi para 'cd' ao sair ---
# Esta função substitui o comando 'yazi' padrão.
function yazi() {
    # Cria um arquivo temporário para armazenar o último diretório
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"

    # Executa o yazi, passando o caminho do arquivo temporário como argumento
    # O Yazi irá escrever o último diretório visitado neste arquivo ao sair.
    command yazi --cwd-file="$tmp" "$@"

    # Se o arquivo temporário foi criado e contém informação...
    if [ -f "$tmp" ]; then
        # ...lê o diretório do arquivo e navega até ele com 'cd'.
        cd "$(cat "$tmp")"
        # Remove o arquivo temporário para não deixar lixo no sistema.
        rm -f "$tmp"
    fi
}

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ll='ls -lha'
alias gs='git status'
alias lg='lazygit'
alias vi='nvim'
