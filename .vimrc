"定义前缀
let mapleader=";"

"开启文件类型侦测
filetype on
filetype plugin on

"文件内容在外部被改时则刷新文件内容
set autoread
set smartcase
set encoding=utf8
set ffs=unix,dos,mac
set smarttab

"定义快捷键到行首和行尾
nmap LB ^
nmap LE $

"将选中文本块复制到系统剪贴板
vnoremap <leader>y "+y
"将系统剪贴板内容粘贴至vim
nmap <leader>p "+p
"定义快捷键关闭当前分割窗口
nmap <leader>q :q<cr>
"定义快捷键保存当前窗口内容
nmap <leader>w :w<cr>
"i定义快捷键保存所有窗口内容并退出vim
nmap <leader>WQ :wa<cr>:q<cr>
"不做保存直接退出vim
nmap <leader>Q :qa!<cr>

"跳至右、左，下、上方窗口
nnoremap <leader>lw <C-W>l
nnoremap <leader>hw <C-W>h
nnoremap <leader>jw <C-W>j
nnoremap <leader>kw <C-W>k

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"拼写检查
"开启或关闭拼写检查
map <leader>ss :setlocal spell!<cr>

"定义快捷键在结对符之间跳转
nmap <leader>M %

"让配置变更理解生效
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

"开启实时搜索
set incsearch

"搜索时大小写不敏感
set ignorecase

"关闭兼容模式
set nocompatible
set backspace=indent,eol,start

"vim自身命令行z模式智能补全
set wildmenu


"总是显示状态栏
set laststatus=2
"显示光标当前位置
set ruler
"开启行号显示
set number
"高亮当前行和列
set cursorline
set cursorcolumn
"高亮显示搜索结果
set hlsearch

"禁止折行
set nowrap


"插件安装
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'derekwyatt/vim-fswitch'
Plug 'dyng/ctrlsf.vim'
Plug 'fholgado/minibufexpl.vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'wesleyche/SrcExpl'
Plug 'vim-scripts/indexer.tar.gz'
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/vimprj'
Plug 'fatih/vim-go',{ 'do': ':GoUpdateBinaries'}
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdcommenter'
call plug#end()

"配色方案
set background=dark
set t_Co=256
"colorscheme solarized
colorscheme molokai

"airline插件配置
"设置状态栏主题风格
let g:airline_powerline_fonts = 1
let g:airline_theme="dark"
let g:airline#extensions#tabline#enabled = 1


"开启语法高亮功能
syntax enable
"允许用指定语法高亮配色方案替换默认方案
syntax on

"自适应不同语言的智能缩进
filetype indent on
"将制表符扩展为空格
set expandtab
"设置编辑时制表符占用的空格数
set tabstop=4
"设置格式化时制表符占用空格数
set shiftwidth=4
"让vim把连续数量的空格视为一个制表符
set softtabstop=4

"indent_guides插件配置
"随vim自启动
let g:indent_guides_enable_on_vim_startup=1
"从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
"色块亮度
let g:indent_guides_guide_size=1
"快捷键i开/关缩进可视化
nmap <silent> <leader>i <Plug>IndentGuidesToggle

"代码折叠
"基于缩进或者语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
"启动vim时关闭z代码折叠
set nofoldenable

"接口和实现之间的切换（*.cpp和*.h之间的切换）
nmap <silent> <leader>sw :FSHere<cr>

"ctrlsf.vim插件配置
"使用ctrlsf.vim插件在工程内全局查找光标所在关键字，sp代表search in project
nnoremap <leader>sp :CtrlSF<cr>

"注释相关
"NERD COmmenter插件配置
"<leader>cc:选中文本加注释 <leader>cu:选中文本去注释
"<leader>c<space>  加上/解开注释, 智能判断；<leader>cy   先复制,再注释(p可以进行黏贴)
" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1

"NERDtree插件配置
"开启nerdtree
nmap <leader>fl :NERDTreeToggle<cr>
"设置NERDTree窗口宽度
let NERDTreeWinSize=32
"设置NERDTree位置
let NERDTreeWinPos="right"
"显示隐藏文件
let NERDTreeShowHidden=1
"NERDTree子窗口不显示冗余信息
let NERDTreeMinimalUI=1
"删除文件时自动删除对应的buffer
let NERDTreeAutoDeleteBuffer=1

"多文档编辑配置
"MiniBufExplorer插件配置
"显示/隐藏MiniBufExplorer
map <leader>bl :MBEToggle<cr>
"buffer切换快捷键
map <c-tab> :MBEbn<cr>
map <c-s-tab> :MBEbp<cr>

"tagbar插件配置
"设置tagbar子窗口的位置
let tagbar_left=1
"设置显示/隐藏标签列表子窗口
nnoremap <leader>tl :TagbarToggle<cr>
"设置标签c子窗口的宽度
let tagbar_width=32
"tagbar子窗口不显示冗余帮助信息
let g:tagbar_compact=1
"设置ctags对哪些代码标识符生成标签
let g_tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

"UltiSnips插件配置，该插件需要python支持
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

"vim下次重启时恢复上次的环境
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
"保存undo历史
set undodir=~/.undo_history/
set undofile
" 保存快捷键
map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
" " 恢复快捷键
map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>

"SrcExpl插件配置
"开启或关闭SrcExpl
nmap <F8> :SrcExplToggle<cr>
"设置SrcExpl窗口高度
let g:SrcExpl_winHeight = 4
"设置SrcExplg窗口更新频率（ms）
let g:SrcExpl_refreshTime = 100
"设置进入某一特定定义的上下文的快捷键
let g:SrcExpl_jumpKey = "<ENTER>"
"设置从上下文定义中返回的快捷键
let g:SrcExpl_gobackKey = "<SPACE>"
"避免与其他插件的冲突
let g:SrcExpl_pluginList = [
   \ "__Tag_List__",
   \ "_NERD_tree_",
   \ "Source_Explorer"
\ ]
"colorscheme
let g:SrcExpl_colorSchemeList = [
   \ "Red",
   \ "Cyan",
   \ "Green",
   \ "Yellow",
   \ "Magenta"
\ ]
"设置SrcExpl进行本地定义搜索
let g:SrcExpl_searchLocalDef = 1
let g:SrcExpl_nestedAutoCmd = 1
let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
"手动更新tags
let g:SrcExpl_updateTagsKey = "<F12>"
"在有多个定义的情况下，F3显示前一个定义，F4显示后一个定义
let g:SrcExpl_prevDefKey = "<F3>"
let g:SrcExpl_nextDefKey = "<F4>"

"代码导航

"基于标签的代码导航
"设置插件 indexer 调用 ctags 的参数
"默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v
"默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
"正向遍历同名标签，先按Ctrl-]，再执行下面两个
nmap <Leader>tn :tnext<CR>
"反向遍历同名标签
nmap <Leader>tp :tprevious<CR>

"vim-go插件配置
let g:go_fmt_command = "goimports"

"ale插件配置
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
""显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap ap <Plug>(ale_previous_wrap)
nmap an <Plug>(ale_next_wrap)
""<Leader>s触发/关闭语法检查
nmap <Leader>al :ALEToggle<cr>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>ad :ALEDetail<cr>
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
let g:ale_linters = {
\   'javascript': ['jshint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck'],
\   'c++': ['clang'],
\   'c': ['clang']
\}

"YCM插件配置

"跳转至声明
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
"跳转至定义，只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>

"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全          
let g:ycm_seed_identifiers_with_syntax=1

" 开启 YCM 标签引擎并引入所需要的tags文件，如c++标准库的等，生成相应文件的tags,用ctags工具，
" 并根据实际情况设置路径，下面只是一个示例。
let g:ycm_collect_identifiers_from_tags_files=1
set tags+=~/.indexer_files_tags/stdcpp.tags
set tags+=~/.indexer_files_tags/stdcppv1.tags

"filetype相关
""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self
au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako
au FileType python map <buffer> F :set foldmethod=indent<cr>
au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#
