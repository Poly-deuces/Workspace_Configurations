" ============================================================
"  Vim 配置（通用编辑 + 开发者/LSP）
"  依赖：vim-plug（https://github.com/junegunn/vim-plug）
"  安装后运行 :PlugInstall 安装插件
" ============================================================

" 插件声明开始，安装目录为 ~/.vim/plugged
call plug#begin('~/.vim/plugged')

" ---- Tim Pope 系列插件 ----
" 快速增删改包围符（括号/引号等），如 cs"' 把双引号改成单引号
Plug 'git@github.com:tpope/vim-surround.git'
" 快速注释/取消注释代码，如 gcc 注释当前行
Plug 'git@github.com:tpope/vim-commentary.git'
" Git 集成，提供 :Git 等命令在 Vim 内操作 Git
Plug 'git@github.com:tpope/vim-fugitive.git'
" 在行号左侧显示当前文件相对 Git 的增删改标记
Plug 'git@github.com:airblade/vim-gitgutter.git'

" ---- 模糊查找 ----
" fzf 命令行模糊查找器本体，do 钩子在安装时执行安装脚本
Plug 'git@github.com:junegunn/fzf.git', { 'do': { -> fzf#install() } }
" fzf 的 Vim 集成，提供 :Files :Buffers 等命令
Plug 'git@github.com:junegunn/fzf.vim.git'

" ---- 界面美化 ----
" 状态栏插件
Plug 'git@github.com:vim-airline/vim-airline.git'
" 状态栏主题库
Plug 'git@github.com:vim-airline/vim-airline-themes.git'

" ---- 文件浏览与代码大纲 ----
" 文件树侧边栏
Plug 'git@github.com:preservim/nerdtree.git'
" 代码结构/符号大纲（依赖 ctags）
Plug 'git@github.com:majutsushi/tagbar.git'

" ---- LSP 与自动补全 ----
" LSP（语言服务器协议）客户端
Plug 'prabirshrestha/vim-lsp'
" 异步补全框架
Plug 'prabirshrestha/asyncomplete.vim'
" 把 LSP 作为 asyncomplete 的补全源
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" 插件声明结束，之后是各项配置
call plug#end()


" ---- 命令行补全与剪贴板 ----
" 启用增强的命令行补全菜单
set wildmenu
" 命令行补全模式：full 表示完整列出所有匹配
set wildmode=full
" 使用系统剪贴板作为默认寄存器，方便与外部程序复制粘贴互通
set clipboard=unnamed

" ---- 基础行为 ----
" 关闭 Vi 兼容模式（启用更多 Vim 特性）
set nocompatible
" 开启文件类型插件
filetype plugin on
" 开启文件类型相关缩进
filetype indent on
" 开启语法高亮
syntax on

" ---- 显示 ----
" 显示行号
set number
" 高亮显示匹配的括号
set showmatch
" 始终显示状态栏（值为 2）
set laststatus=2
" 光标与屏幕上下边缘不保留行距（与开发者配置一致）
set scrolloff=0

" ---- 缩进与制表符 ----
" Tab 显示宽度为 4 个空格
set tabstop=4
" 缩进宽度为 4 个空格
set shiftwidth=4
" 把 Tab 展开为空格
set expandtab
" 自动继承上一行的缩进
set autoindent
" 退格键可删除的范围：缩进、行尾、行首之前的内容
set backspace=indent,eol,start

" ---- 搜索 ----
" 搜索默认忽略大小写
set ignorecase
" 当搜索词含大写字母时自动区分大小写
set smartcase
" 增量搜索：输入过程中即时高亮匹配
set incsearch
" 高亮所有搜索结果
set hlsearch

" ---- 文件与缓冲区 ----
" 文件被外部修改时自动重新加载
set autoread
" 退出/有未保存内容等操作前需要确认
set confirm
" 允许切换缓冲区而不必先保存
set hidden
" 启用持久化撤销记录（关闭再打开还能撤销）
set undofile
" 撤销记录保存目录
set undodir=~/.vim/undo

" ---- 分屏 ----
" 新分屏在右侧打开
set splitright
" 新分屏在下方打开
set splitbelow

" ---- 开发者 / LSP 配置（合并自 vimrc-full.txt）----
" C/C++ 缩进风格微调（影响大括号、case、标签等的缩进行为）
autocmd FileType c,cpp setlocal cinoptions=:0,(0,l1,t0,W2s,N-s,E-s,g0
" 文件编码探测顺序（含中文 GB 系列），内部编码 UTF-8，菜单语言不随 locale 变化
set fileencodings=utf-8,latin-1,gb18030,gbk,gb2312 encoding=utf-8 langmenu=none
" 不显示标题、显示标尺（行列位置）、启用 modeline、modeline 检查前 6 行、关闭所有响铃
set notitle ruler modeline modelines=6 belloff=all
" 不重置起始列、跳转使用栈（支持 ctrl-o/ctrl-i 记录历史）
set nostartofline jumpoptions=stack
" 行号宽度 9，同时显示相对行号，始终预留符号列（用于诊断/标记图标）
set numberwidth=9 relativenumber signcolumn=yes
" 补全选项：弹出菜单且只显示一项、不自动插入、显示预览窗口
set completeopt=menuone,noinsert,preview
" 让符号列（SignColumn）背景/前景透明，与主题保持一致
highlight SignColumn ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
" 取消错误文本的高亮
highlight Error NONE
" 界面语言设为 C（即英文，避免本地化翻译）
language C

" ---- 插件相关变量 ----
" 关闭 markdown 推荐风格（使用 Vim 默认 markdown 处理）
let g:markdown_recommended_style = 0
" 不让 asyncomplete 自动修改 completeopt（保持上面的设置）
let g:asyncomplete_auto_completeopt = 0
" 开启 LSP 诊断（错误/警告）显示
let g:lsp_diagnostics_enabled = 1

" 插入模式下回车：若补全菜单弹出则选第一项（<c-y>），否则正常回车
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<cr>"

" 静默加载 ~/.lsp.vim（若存在，用于存放各语言 LSP 服务器配置）
silent! source ~/.lsp.vim

" ---- 按键映射 ----
" <C-n>：切换 NERDTree 文件树
nnoremap <C-n> :NERDTreeToggle<CR>
" <leader>f：在文件树中定位并展开当前文件
nnoremap <leader>f :NERDTreeFind<CR>
