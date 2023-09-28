" 用于配置 ALE 插件的 linting 选项，使用 clang 和 gcc
let g:ale_linters = {
\   'c': ['clang', 'gcc', 'clang-tidy', 'cppcheck'],
\   'cpp': ['clang', 'gcc', 'clang-tidy', 'cppcheck'],
\}

" 配置 ALE 插件的修复器选项
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\}

" 保存时自动修复
let g:ale_fix_on_save = 1

" 在插入模式下映射 kj 为 <esc>
imap kj <esc>

" 设置缩进宽度
set shiftwidth=4
set tabstop=4

" 为 C/C++ 配置自动缩进
" 当启用 clang-format 时，关闭自动缩进

" 设置 vim 为非兼容模式，开启 Vim 的功能
set nocompatible

" 开启语法高亮
syntax on

" 禁用 Vim 默认的启动消息
set shortmess+=I

" 显示行号
set number
set relativenumber  " 同时开启相对行号模式

" 总是显示状态栏
set laststatus=2

" 配置退格键的行为
set backspace=indent,eol,start

" 允许隐藏含有未保存更改的缓冲区
set hidden

" 搜索相关配置
set ignorecase  " 搜索时忽略大小写
set smartcase   " 如果搜索包含大写字母，则进行大小写敏感搜索
set incsearch   " 启用输入即搜

" 禁用一些无用/烦人的默认键绑定
nmap Q <Nop>  " 禁用 'Q' 键进入 Ex 模式

" 禁用声音铃声
set noerrorbells visualbell t_vb=

" 启用鼠标支持
set mouse+=a

" 试图防止一些不良习惯，例如使用箭头键进行移动
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" 定义一个新的 Vim 命令 Cv，用于将指定范围的行复制到剪贴板
command! -range Cv <line1>,<line2>w !iconv -f utf-8 -t utf-16le | clip.exe

" 在 Visual 模式下，为选中的文本定义一个快捷键 <Leader>c，用于复制到剪贴板
vnoremap <Leader>c :w !iconv -f utf-8 -t utf-16le \| clip.exe<CR>
