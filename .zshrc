# 启用 Powerlevel10k 即时提示。应该保持在 ~/.zshrc 的顶部。
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh  # 设置 oh-my-zsh 安装路径
ZSH_THEME="powerlevel10k/powerlevel10k"  # 设置主题为 powerlevel10k

# 加载插件
plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh  # 加载 oh-my-zsh

. /usr/share/autojump/autojump.sh  # 加载 autojump

# 如果存在，则加载 p10k 配置文件
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# 避免显示 p10k 的警告消息
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# 启动 ssh-agent
eval "$(ssh-agent -s)" > /dev/null

# 如果存在，自动加载 SSH 私钥
if [ -d "$HOME/.ssh" ]; then
    find $HOME/.ssh -maxdepth 1 -type f ! -name "*.pub" -exec ssh-add {} \; 2>/dev/null
fi

# 设置默认编辑器为 vim
export EDITOR=vim

# 添加 snap bin 到 PATH
export PATH=$PATH:/snap/bin/

# 从 Clash 加载代理配置
source ~/.proxyrc

# 添加 sudoperf 到 PATH 并设置别名
export PATH=$PATH:/home/zmr466/WSL2-Linux-Kernel/tools/perf
alias sudoperf='sudo env "PATH=$PATH:/home/zmr466/WSL2-Linux-Kernel/tools/perf" perf'

# 初始化 conda
__conda_setup="$('/home/zmr466/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/zmr466/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/zmr466/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/zmr466/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# 显示 WSL2 在 Windows 宿主机上的 IP 地址
source ~/IP_WslOnWin.sh

# 添加 wclip.sh 到 PATH (用于管道运算符的 win-clip 复制脚本)
export PATH="$PATH:/home/zmr466/zmrDotfiles"

# 检查 CUDA Toolki工具链目录是否存在
if [ -d "/usr/local/cuda-12.3/bin" ]; then
    export PATH="/usr/local/cuda-12.3/bin:$PATH"
fi

# 检查 CUDA lib64 目录是否存在
if [ -d "/usr/local/cuda-12.3/lib64" ]; then
    export LD_LIBRARY_PATH="/usr/local/cuda-12.3/lib64:$LD_LIBRARY_PATH"
    # 注意：理想状况应当放在/etc/ld.so.conf 文件中，然后运行ldconfig来更新
fi

# 注意：如果要卸载CUDA工具集，可以：
# 运行位于 /usr/local/cuda-12.3/bin 目录下的 cuda-uninstaller
