call plug#begin('~/.vim/plugged')
Plug 'valloric/youcompleteme'			"代码补全
Plug 'scrooloose/nerdtree'              " 文件树
Plug 'plasticboy/vim-markdown'          " markdown高亮
Plug 'octol/vim-cpp-enhanced-highlight' " C++代码高亮
Plug 'Xuyuanp/nerdtree-git-plugin'      "查看git
" 可以快速对齐的插件
Plug 'junegunn/vim-easy-align'
" 可以使 nerdtree Tab 标签的名称更友好些
Plug 'jistr/vim-nerdtree-tabs'
" 可以在导航目录中看到 git 版本信息
Plug 'Xuyuanp/nerdtree-git-plugin'
" 查看当前代码文件中的变量和函数列表的插件，
" 可以切换和跳转到代码中对应的变量和函数的位置
" 大纲式导航, Go 需要 https://github.com/jstemmer/gotags 支持
Plug 'majutsushi/tagbar'
" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plug 'vim-airline/vim-airline'
" 可以在文档中显示 git 信息
Plug 'airblade/vim-gitgutter'

" 配色方案
" colorscheme monokai
Plug 'sickill/vim-monokai'              " monokai主题
" colorscheme neodark
Plug 'KeitaNakamura/neodark.vim'
" colorscheme github
Plug 'acarapetis/vim-colors-github'
" colorscheme one
Plug 'rakr/vim-one'
" colorscheme gruvbox
Plug 'morhetz/gruvbox'					" 主题	

" go 主要插件
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'jstemmer/gotags'

Plug 'voldikss/vim-floaterm'

call plug#end()

autocmd BufWritePost $MYVIMRC source $MYVIMRC
colorscheme neodark
Plug 'rakr/vim-one'
"set background=dark
filetype on
set signcolumn=yes "强制显示侧边栏，防止时有时无
syntax on
set shiftwidth=4
set tabstop=4
let g:ycm_clangd_binary_path='clangd'
set number
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
" 为C程序提供自动缩进
set smartindent
set cursorline " 突出显示当前行
"光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号"
set showmatch
"解决无法删除上一次编译内容
set backspace=indent,eol,start

"括号自动匹配补全"
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap { {<CR>}<Esc>O

" C++的编译和运行
map <F5> :call CompileRunGpp()<CR>
func! CompileRunGpp()
exec "w"
exec "!g++ % -o %<"
exec "! ./%<"
endfunc

"==============================================================================
" YouCompleteMe
"==============================================================================
set runtimepath+=~/.vim/bundle/YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |            " 回车即选中当前项
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|     " 跳转到定义处

let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项
let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

"==============================================================================
" vim-go 插件
"==============================================================================
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1

let g:godef_split=2
autocmd FileType go nmap <buffer> gb  <Plug>(go-build)
autocmd FileType go nmap <buffer> gr  <Plug>(go-run)


"==============================================================================
" 终端模式下, 切换终端
"==============================================================================
tnoremap <silent> <C-n> <C-\><C-n>:FloatermNext<CR>
" 新建terminal windows
let g:floaterm_keymap_new = '<Leader>tw'
" 切换terminal模式
let g:floaterm_keymap_toggle = '<Leader>tt'
let g:floaterm_wintype = 'float'
let g:floaterm_position = 'center'
" 终端宽(0,1)
let g:floaterm_width = 0.6
" 终端高(0,1)
let g:floaterm_height = 0.4
" 终端标题
let g:floaterm_title = 'floaterm: $1/$2'

"==============================================================================
" 绑定F2到NERDTreeToggle
"==============================================================================
map <C-e> :NERDTreeToggle<CR>