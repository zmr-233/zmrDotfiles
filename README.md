
# Dotfiles

这是我的个人dotfiles配置，用于快速设置和同步我的开发环境。

## 包含的文件

- `.gitconfig`: Git的配置文件
- `.proxyrc`: 代理设置
- `.vimrc`: Vim编辑器的配置
- `.zshrc`: Zsh shell的配置

## 注意事项

1. 当不使用代理时，请确保从`.zshrc`中删除对应的代理语句。
2. `.proxyrc`文件是专门为WSL2代理准备的，请注意clash的端口号。
3. Vim使用了以下插件，请确保安装：
    - clang
    - gcc
    - clang-tidy
    - cppcheck

    安装方法：不要使用Vim插件管理器！！使用 Vim 8+ 的原生插件管理安装 linting 插件
4. ALE安装方法
    1. 安装ALE & clang-format
        ```bash
        # 1.创建所需的目录结构：
        mkdir -p ~/.vim/pack/vendor/start/

        # 2.在此目录中克隆 ALE 插件：
        cd ~/.vim/pack/vendor/start/
        git clone https://github.com/dense-analysis/ale.git

        # 3.打开 Vim 并检查 :h ale 以确保插件已成功安装。

        # 4.在你的 ~/.vimrc 中添加以下行来启用 linting 和格式化功能：
        # 确保安装了clang 和 gcc，以及 clang-format(自动格式化)
        let g:ale_linters = {
        \   'c': ['clang', 'gcc'],
        \   'cpp': ['clang', 'gcc'],
        \}
        let g:ale_fixers = {
        \   '*': ['remove_trailing_lines', 'trim_whitespace'],
        \   'c': ['clang-format'],
        \   'cpp': ['clang-format'],
        \}
        let g:ale_fix_on_save = 1

        --------------------clang-format安装-----------------
        sudo apt-get update
        sudo apt-get install clang-format
        # cindent 主要用于 Vim 内部的自动缩进功能，
        # 而 clang-format 通常用于格式化整个文件或文件的某个部分

        ```
    2. 安装clang-tidy和cppcheck
        ```bash
        sudo apt update
        sudo apt install clang-tidy cppcheck

        let g:ale_linters = {
        \   'c': ['clang', 'gcc', 'clang-tidy', 'cppcheck'],
        \   'cpp': ['clang', 'gcc', 'clang-tidy', 'cppcheck'],
        \}

        let g:ale_fixers = {
        \   '*': ['remove_trailing_lines', 'trim_whitespace'],
        \   'c': ['clang-format'],
        \   'cpp': ['clang-format'],
        \}

        let g:ale_fix_on_save = 1


        # 如果需要手动触发 linting 或 fixing，可以使用以下命令：
        :ALELint
        :ALEFix
        ```

4. Zsh使用了`oh-my-zsh`以及以下插件和主题：
    [详细安装方法](https://github.com/zsh-users/)
    ```bash
    sudo apt update
    sudo apt install zsh
    chsh -s /usr/bin/zsh #更改默认shell
    echo $SHELL

    # oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # sudo sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```
    - `powerlevel10k/powerlevel10k`: 主题
        ```bash
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

        # powerline font字体
        sudo apt-get install fonts-powerline

        # ~/.zshrc编辑：
        ZSH_THEME="powerlevel10k/powerlevel10k"

        # 重新配置10k
        p10k configure

        # Install Dracula theme for GNOME terminal
        ```
    - `autojump`: 插件
    - `zsh-autosuggestions`: 插件
        ```bash
        git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
        ```
    - `zsh-syntax-highlighting`: 插件
        ```bash
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
        ```
    - 添加插件列表vim ~/.zshrc，插件之间用空格分开
        ```bash
        # Example format: plugins=(rails git textmate ruby lighthouse)
        plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting)
        ```
    安装方法：首先，确保已安装[oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)，然后根据各插件的GitHub仓库说明来安装。

5. 创建符号链接的方法:
    ```bash
    ln -s ~/zmrDotfiles/.gitconfig ~/.gitconfig
    ```
    检查链接的方法：
    ```bash
    ls -l ~/.gitconfig
    ```

6. `.gitconfig`中包含了一些有用的Git别名，如`lg`和`ss`。
    ```bash
    # log推荐指令：
    $ git lg
    # git config --global alias.lgg 'log --decorate --oneline --graph --all --color=always'

    # log | cat推荐指令：
    $ git lgg
    # git config --global alias.lgc '!sh -c "git log --decorate --oneline --graph --all --color=always | cat"'

    # status 指令
    $ git ss
    # git config --global alias.ss 'status -s'
    ```
7. `.zshrc`中包含了一些有用的别名和环境变量设置，如`sudoperf`和`EDITOR`。
    ```bash
    # 增加了sudoperf ，作为sudo perf的替代品
    $ sudoperf
    $ perf
    # .proxyrc中增加别名，用于sudo保留代理
    $ sudop
    ```

7. `.tmux.conf`包含了一些有用的按键映射
	- <C-a> 代替Ctrl+b
	- h/j/k/l 代替方向键
	- 复制模式为Vim风格
	- 增加鼠标支持
