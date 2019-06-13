"定义前缀
let mapleader=";"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 通用配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"开启文件类型侦测
filetype on
filetype plugin on

"文件内容在外部被改时则刷新文件内容
set autoread
set smartcase

set encoding=utf8
set ffs=unix,dos,mac

"让配置变更理解生效
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

"开启实时搜索
set incsearch
"高亮显示搜索结果
set hlsearch
"搜索时大小写不敏感
set ignorecase

"关闭兼容模式
set nocompatible
set backspace=indent,eol,start

"vim自身命令行模式智能补全
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

"禁止折行
set nowrap

"开启语法高亮功能
syntax enable
"允许用指定语法高亮配色方案替换默认方案
syntax on

"自适应不同语言的智能缩进
filetype indent on
set autoindent
set cindent
set smartindent

set smarttab
"将制表符扩展为空格
set expandtab
"设置编辑时制表符占用的空格数
set tabstop=4
"设置格式化时制表符占用空格数
set shiftwidth=4
"让vim把连续数量的空格视为一个制表符
set softtabstop=4

"基于缩进或者语法进行代码折叠
set foldmethod=syntax
"启动vim时关闭代码折叠
set nofoldenable

"加强vimdiff功能
if has('patch-8.1.0388')
	set diffopt+=internal,algorithm:patience
	set diffopt+=indent-heuristic
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"插件安装
call plug#begin('~/.vim/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'derekwyatt/vim-fswitch'
Plug 'dyng/ctrlsf.vim'
Plug 'fholgado/minibufexpl.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'fatih/vim-go',{ 'do': ':GoUpdateBinaries'}
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/vim-signify'
Plug 'skywind3000/vim-preview'
Plug 'Shougo/echodoc.vim'
Plug 'skywind3000/asyncrun.vim', { 'on': ['AsyncRun','AsyncStop'] }
Plug 'kien/rainbow_parentheses.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'easymotion/vim-easymotion'
Plug 'liuchengxu/vim-which-key'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'mg979/vim-visual-multi'
Plug 'mhinz/vim-startify'
Plug 'voldikss/vim-translate-me'
"Plug 'lervag/vimtex'
call plug#end()

"配色方案
set background=dark
set t_Co=256
"colorscheme molokai
colorscheme hybrid

"echodoc.vim插件配置
"启动vim时打开echodoc
let g:echodoc_enable_at_startup = 1
"关闭vim默认的模式显示
set noshowmode

"airline插件配置
"设置状态栏主题风格
let g:airline_powerline_fonts = 1
let g:airline_theme="dark"
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#right_sep = ' '
"let g:airline#extensions#tabline#right_alt_sep = '|'

"asyncrun.vim插件配置
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml']
let g:asyncrun_open = 8
let g:asyncrun_save = 2

"vim-preview插件配置
noremap <silent><leader>pt :PreviewTag<cr>
noremap <silent><leader>pc :PreviewClose<cr>
nnoremap <silent><leader>ps :PreviewSignature<cr>
inoremap <silent><leader>ps <c-\><c-o>:PreviewSignature<cr>
noremap <leader>pu :PreviewScroll -1<cr>
noremap <leader>pd :PreviewScroll +1<cr>
inoremap <leader>pu <c-\><c-o>:PreviewScroll -1<cr>
inoremap <leader>pd <c-\><c-o>:PreviewScroll +1<cr>

"indent_guides插件配置
"随vim自启动
"let g:indent_guides_enable_on_vim_startup=1
"从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
"色块亮度
let g:indent_guides_guide_size=1
"快捷键开/关缩进可视化
noremap <silent> <leader>it :IndentGuidesToggle<cr>

"vim-fswitch插件配置
"接口和实现之间的切换（*.cpp和*.h之间的切换）
noremap <silent> <leader>fs :FSHere<cr>

"ctrlsf.vim插件配置
"使用ctrlsf.vim插件在工程内全局查找光标所在关键字，sp代表search in project
nnoremap <leader>sp :CtrlSF<cr>
vmap     <leader>sf <Plug>CtrlSFVwordPath
vmap     <leader>sF <Plug>CtrlSFVwordExec
nmap     <leader>sn <Plug>CtrlSFCwordPath
nnoremap <leader>st :CtrlSFToggle<cr>
inoremap <leader>st <Esc>:CtrlSFToggle<cr>
let g:ctrlsf_ackprg = 'ag'

"NERD COmmenter插件配置
"<leader>cc:选中文本加注释 <leader>cu:选中文本去注释
"<leader>c<space>  加上/解开注释, 智能判断；<leader>cy   先复制,再注释(p可以进行黏贴)
" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1

"NERDtree插件配置
"开启nerdtree
noremap <leader>lf :NERDTreeToggle<cr>
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

"vim-nerdtree-tabs插件配置
"设置打开vim的时候默认打开目录树
let g:nerdtree_tabs_open_on_console_startup=1

"nerdtree-git-plugin插件配置
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
\}

"MiniBufExplorer插件配置
"显示/隐藏MiniBufExplorer
map <leader>bl :MBEToggle<cr>
"buffer切换快捷键
noremap <leader>bn :bn<cr>
noremap <leader>bp :bp<cr>

"tagbar插件配置
"设置tagbar子窗口的位置
let tagbar_left=1
"设置显示/隐藏标签列表子窗口
nnoremap <leader>lt :TagbarToggle<cr>
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

let g:tagbar_type_lua = {
  \ 'ctagstype' : 'lua',
  \ 'kinds' : [
    \ 'm:modules:0:0',
    \ 'f:functions:0:1',
    \ 'v:locals:0:0'
  \ ],
  \ 'sort' : 0
\ }

"UltiSnips插件配置，补全代码模板，该插件需要python支持
let g:UltiSnipsExpandTrigger="<leader>sd"
let g:UltiSnipsJumpForwardTrigger="<leader>sd"
let g:UltiSnipsJumpBackwardTrigger="<leader>su"

"vim-go插件配置
let g:go_fmt_command = "goimports"

"ale插件配置
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
""显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，<c-k>前往上一个错误或警告，<c-j>前往下一个错误或警告
nmap <c-k> <Plug>(ale_previous_wrap)
nmap <c-j> <Plug>(ale_next_wrap)
"触发/关闭语法检查
nmap <leader>al :ALEToggle<cr>
"查看错误或警告的详细信息
nmap <leader>ad :ALEDetail<cr>
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
let g:ale_linters = {
\   'javascript': ['jshint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck'],
\   'c++': ['clang'],
\   'c': ['clang']
\}
"linter参数设置
let g:ale_c_gcc_options = '-Wall -O2 -std=c99' 
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14' 
let g:ale_c_cppcheck_options = '' 
let g:ale_cpp_cppcheck_options = ''

"Leaderf插件配置
let g:Lf_ShortcutF = ''
let g:Lf_ShortcutB = ''
noremap <leader>fm :LeaderfMru<cr> 
inoremap <leader>fm <c-\><c-o>:LeaderfMru<cr>
noremap <leader>ff :LeaderfFunction<cr> 
inoremap <leader>ff <c-\><c-o>:LeaderfFunction<cr>
noremap <leader>fb :LeaderfBuffer<cr> 
inoremap <leader>fb <c-\><c-o>:LeaderfBuffer<cr>
noremap <leader>ft :LeaderfTag<cr> 
inoremap <leader>ft <c-\><c-o>:LeaderfTag<cr>
noremap <leader>fp :LeaderfFile<cr>
inoremap <leader>fp <c-\><c-o>:LeaderfFile<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' } 
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git'] 
let g:Lf_WorkingDirectoryMode = 'Ac' 
let g:Lf_WindowHeight = 0.30 
"let g:Lf_CacheDirectory = expand('~/.vim/cache') 
let g:Lf_ShowRelativePath = 0 
let g:Lf_HideHelp = 1  
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

"Leaderf rg配置
"search word under cursor, the pattern is treated as regex, and enter normal mode directly
noremap <leader>fg :<c-u><c-r>=printf("Leaderf! rg -e %s ", expand("<cword>"))<cr>
"search word under cursor literally only in current buffer
noremap <leader>fc :<c-u><c-r>=printf("Leaderf! rg -F --current-buffer -e %s ", expand("<cword>"))<cr>
"search visually selected text literally, don't quit LeaderF after accepting an entry
xnoremap <leader>fv :<c-u><c-r>=printf("Leaderf! rg -F --stayOpen -e %s ", leaderf#Rg#visual())<cr>
"recall last search. If the result window is closed, reopen it.
noremap <leader>fr :<c-u>Leaderf! rg --stayOpen --recall<cr>

"vim-signify插件配置
set signcolumn=yes

"YCM插件配置
"跳转至声明
nnoremap <leader>jc :YcmCompleter GoToDeclaration<cr>
"跳转至定义，只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDefinition<cr>

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

"YCM 补全菜单配色
"菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
"选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
"补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
"允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
"补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
"从第一个键入字符就开始罗列匹配项
"let g:ycm_min_num_of_chars_for_completion=1
"禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
"语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
"显示详细错误/警告信息快捷键
let g:ycm_key_detailed_diagnostics = '<leader>dd'
"回车作为选中
let g:ycm_key_list_stop_completion = ['<cr>']

"开启 YCM 标签引擎并引入所需要的tags文件，如c++标准库的等，生成相应文件的tags,用ctags工具，
"并根据实际情况设置路径，下面只是一个示例。
let g:ycm_collect_identifiers_from_tags_files=1
set tags+=~/.cache/tags/stdcpp.tags
set tags+=~/.cache/tags/stdcppv1.tags

"vim-gutentags插件配置
"gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
"所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags' 
"将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags 
"配置 ctags 的参数 
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q'] 
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px'] 
let g:gutentags_ctags_extra_args += ['--c-kinds=+px'] 
"检测 ~/.cache/tags 不存在就新建 
if !isdirectory(s:vim_tags) 
    silent! call mkdir(s:vim_tags, 'p') 
endif

"rainbow_parentheses.vim插件配置
let g:rbpt_colorpairs = [ 
    \ ['brown', 'RoyalBlue3'], 
    \ ['Darkblue', 'SeaGreen3'], 
    \ ['darkgray', 'DarkOrchid3'], 
    \ ['darkgreen', 'firebrick3'], 
    \ ['darkcyan', 'RoyalBlue3'], 
    \ ['darkred', 'SeaGreen3'], 
    \ ['darkmagenta', 'DarkOrchid3'], 
    \ ['brown', 'firebrick3'], 
    \ ['gray', 'RoyalBlue3'], 
    \ ['darkmagenta', 'DarkOrchid3'], 
    \ ['Darkblue', 'firebrick3'], 
    \ ['darkgreen', 'RoyalBlue3'], 
    \ ['darkcyan', 'SeaGreen3'], 
    \ ['darkred', 'DarkOrchid3'], 
    \ ['red', 'firebrick3'], 
\ ] 
let g:rbpt_max = 16 
let g:rbpt_loadcmd_toggle = 0 
au VimEnter * RainbowParenthesesToggle 
au Syntax * RainbowParenthesesLoadRound 
au Syntax * RainbowParenthesesLoadSquare 
au Syntax * RainbowParenthesesLoadBraces

"vim-autoformat插件配置
nnoremap <leader>af :Autoformat<CR> 
let g:autoformat_autoindent = 0 
let g:autoformat_retab = 0 
let g:autoformat_remove_trailing_spaces = 0
"保存时自动格式化代码，针对所有支持的文件
au BufWrite * :Autoformat

"vim-which-key插件配置
set timeoutlen=500
"1. 显示<leader>作为前缀的命令提示信息
nnoremap <silent> <leader> :<c-u>WhichKey ';'<cr>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual ';'<cr>
let g:which_key_map =  {}
call which_key#register(';', "g:which_key_map")
let g:which_key_map.w = {
    \'name': '+window/write',
    \'h': 'window-left',
    \'j': 'window-below',
    \'k': 'window-up',
    \'l': 'window-right',
    \'H': 'window-vertical-decrease',
    \'J': 'window-horizontal-increase',
    \'K': 'window-horizontal-decrease',
    \'L': 'window-vertical-increase',
    \'s': ['<c-w>s','split-window-horizontal'],
    \'v': ['<c-w>v','split-window-vertical'],
    \'q': 'save-all-and-quit-vim',
\}

let g:which_key_map.l = {
    \'name': '+list/line',
    \'f': 'open-nerdtree',
    \'t': 'open-tagbar',
    \'b': 'go-to-line-begin',
    \'e': 'go-to-line-end',
\}

let g:which_key_map.b = {
    \'name': '+buffer',
    \'l': 'open-minibufexpl',
    \'n': 'next-buffer',
    \'p': 'previous-buffer',
\}

let g:which_key_map.a = {
    \'name': '+ale/autoformat',
    \'l': 'toggle-ale',
    \'d': 'ale-error/warning-detail',
    \'f': 'toggle-autoformat',
\}

let g:which_key_map.j = {
    \'name': '+jump',
    \'d': 'go-to-definition',
    \'c': 'go-to-declaration',
    \'p': 'jump-to-pairing-symbols',
\}

let g:which_key_map.i = {
    \'name': '+indent',
    \'t': 'toggle-indent-guides',
\}

let g:which_key_map.f = {
    \'name': '+file/find',
    \'f': 'leaderf-function',
    \'p': 'leaderf-file',
    \'m': 'leaderf-mru',
    \'t': 'leaderf-tag',
    \'b': 'leaderf-buffer',
    \'s': 'switch-between-.h-.cpp',
    \'g': 'find-word-under-cursor',
    \'c': 'find-word-under-cursor-in-current-buffer',
    \'v': '(visual)find-selected-text',
    \'r': 'recall-last-find',
\}

let g:which_key_map.s = {
    \'name': '+search/spell/session/snippets',
    \'t': 'toggle-ctrlsf',
    \'p': 'search-word-under-cursor',
    \'f': '(visual)search-selected-text',
    \'F': '(visual)search-selected-text',
    \'n': 'search-word-under-cursor',
    \'s': 'toggle-spell-checking',
    \'r': 'restore-vim-session',
    \'h': 'save-vim-session',
    \'d': 'snippets-expand-or-jump-forward',
    \'u': 'snippets-jump-backward',
\}

let g:which_key_map.c = {
    \'name': '+comment/copy',
    \'c': 'comment-selected-text',
    \'u': 'uncomment-selected-text',
    \'y': 'copy-and-comment-selected-text',
    \'s': 'copy-to-system-clipboard',
\}

let g:which_key_map.q = {
    \'name': '+quit',
    \'a': 'quit-without-saving',
    \'c': 'quit-current-window',
\}

let g:which_key_map.p = {
    \'name': '+preview/paste',
    \'p': 'paste-from-system-clipboard',
    \'t': 'preview-tag-under-cursor',
    \'c': 'close-preview-window',
    \'s': 'preview-signature-under-cursor',
    \'u': 'preview-window-scroll-up',
    \'d': 'preview-windos-scroll-down',
\}

let g:which_key_map.n = {
    \'name': '+no',
    \'h': 'quit-highlight-search',
\}

let g:which_key_map.d = {
    \'name': '+display',
    \'f': 'display-fullscreen',
    \'d': 'display-ycm-detailed-diagnostic',
\}

let g:which_key_map[';'] = {
    \'name': '+easymotion',
    \'w': ['<Plug>(easymotion-w)', 'beginning-of-word-forward'],
    \'b': ['<Plug>(easymotion-b)', 'beginning-of-word-backword'],
    \'j': ['<Plug>(easymotion-j)', 'jump-line-downward'],
    \'k': ['<Plug>(easymotion-k)', 'jump-line-upward'],
    \'s': ['<Plug>(easymotion-s)', 'search-char-forward-or-backward'],
\}

let g:which_key_map.t = {
    \'name': '+tab/tag/translate',
    \'m': 'new-tab',
    \'c': 'close-tab',
    \'n': 'go-to-next-tab',
    \'p': 'go-to-previous-tab',
    \'b': 'go-to-previous-tag',
    \'a': 'go-to-next-tag',
    \'t': 'translate-word-under-cursor',
    \'w': 'translate-word-under-cusor-in-popup-window',
    \'r': 'repalce-word-under-cursor-with-translation',
\}

let g:which_key_map.m = {
    \'name': '+multi',
    \'w': 'find-word-under-cursor',
    \'r': 'start-regex-search',
    \'l': 'append-selected-text-from-right',
    \'h': 'append-selected-text-from-left',
    \'a': 'select-all-word-under-cursor',
    \'u': 'add-cursor-up',
    \'d': 'add-cursor-down',
    \'t': '(visual)select-all-selected-text',
    \'n': 'jump-to-next-equal-region',
\}

"limelight.vim和Goyo.vim插件配置
"打开/关闭Goyo
nnoremap <leader>df :Goyo<cr>
inoremap <leader>df  <c-\><c-o>:Goyo<cr>
"定义打开/关闭Goyo时，一并打开/关闭的插件
function! s:goyo_enter()
    MBEClose
    NERDTreeToggle
    RainbowParenthesesToggle
    Limelight
endfunc
function! s:goyo_leave()
    Limelight!
    RainbowParenthesesToggle
endfunc
autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

"vim-visual-multi插件配置
let g:VM_default_mappings = 0
let g:VM_maps = {}
let g:VM_leader = ";"
let g:VM_maps["Select All"] = '<leader>ma'
let g:VM_maps["Add Cursor Down"] = '<leader>md'
let g:VM_maps["Add Cursor Up"] = '<leader>mu'
let g:VM_maps["Select l"] = '<leader>ml'
let g:VM_maps["Select h"] = '<leader>mh'
let g:VM_maps['Find Under'] = '<leader>mw'
let g:VM_maps["Start Regex Search"] = '<leader>mr'
let g:VM_maps["Visual All"] = '<leader>mt'
let g:VM_maps["Alt Skip"] = '<leader>mn'

"vim-startify插件配置
autocmd VimEnter *
    \   if !argc()
    \ |   Startify
    \ |   wincmd w
    \ | endif
let g:startify_custom_footer = [
    \"\t业精于勤荒于嬉，行成于思毁于随",
\]
let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   Most recently used files:']},
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks:']},
\]

"vim-translate-me插件配置
let g:vtm_default_mapping = 0
"<Leader>t 翻译光标下的文本，在命令行回显翻译内容
nmap <silent> <Leader>tt <Plug>Translate
vmap <silent> <Leader>tt <Plug>TranslateV
"Leader>w 翻译光标下的文本，在窗口中显示翻译内容
nmap <silent> <Leader>tw <Plug>TranslateW
vmap <silent> <Leader>tw <Plug>TranslateWV
"Leader>r 替换光标下的文本为翻译内容
nmap <silent> <Leader>tr <Plug>TranslateR
vmap <silent> <Leader>tr <Plug>TranslateRV

"vimtex插件配置
"let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_mode=0
"set conceallevel=1
"let g:tex_conceal='abdmg'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 操作配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"定义快捷键到行首和行尾
noremap <leader>lb ^
noremap <leader>le $

"定义从Insert模式退回到Normal模式的快捷键
inoremap jk <esc>

"将选中文本块复制到系统剪贴板
vnoremap <leader>cs "+y
"将系统剪贴板内容粘贴至vim
noremap <leader>pp "+p
"定义快捷键关闭当前分割窗口
noremap <leader>qc :q<cr>
"定义快捷键保存所有窗口内容并退出vim
noremap <leader>wq :wa<cr>:qa!<cr>
"不做保存直接退出vim
noremap <leader>qa :qa!<cr>

"跳至右、左，下、上方窗口
nnoremap <leader>wl <c-w>l
nnoremap <leader>wh <c-w>h
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k

"c-j c-k c-h c-l后续用于扩展其他插件命令
"map <c-j> <c-w>j
"map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

"调整windows大小
noremap <silent><leader>wJ :resize +3<cr>
noremap <silent><leader>wK :resize -3<cr>
noremap <silent><leader>wH <c-w>3<
noremap <silent><leader>wL <c-w>3>

"开启或关闭拼写检查
noremap <leader>ss :setlocal spell!<cr>

"定义快捷键在结对符之间跳转
noremap <leader>jp %

"vim标签相关快捷键
noremap <silent><leader>tm :tabnew<cr>
noremap <silent><leader>tc :tabclose<cr>
noremap <silent><leader>tn :tabn<cr>
noremap <silent><leader>tp :tabp<cr>
noremap <silent><leader>1 :tabn 1<cr>
noremap <silent><leader>2 :tabn 2<cr>
noremap <silent><leader>3 :tabn 3<cr>
noremap <silent><leader>4 :tabn 4<cr>
noremap <silent><leader>5 :tabn 5<cr>
noremap <silent><leader>6 :tabn 6<cr>
noremap <silent><leader>7 :tabn 7<cr>
noremap <silent><leader>8 :tabn 8<cr>
noremap <silent><leader>9 :tabn 9<cr>
noremap <silent><leader>0 :tabn 10<cr>
noremap <silent><s-tab> :tabnext<cr>

"大括号输入左括号回车，会补全右括号并换行缩进
inoremap {<cr> {<cr>}<esc>O
inoremap " ""<esc>i
inoremap ( ()<esc>i
inoremap ' ''<esc>i
inoremap [ []<esc>i

"vim下次重启时恢复上次的环境
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
"保存undo历史
set undodir=~/.undo_history/
set undofile
"保存快捷键
map <leader>sh :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
"恢复快捷键
map <leader>sr :source my.vim<cr> :rviminfo my.viminfo<cr>

"Visual模式下搜索选中的部分:*用于向后搜索，#用于向前搜索
vnoremap <silent> * :<c-u>call VisualSelection('', '')<cr>/<c-r>=@/<cr><cr>
vnoremap <silent> # :<c-u>call VisualSelection('', '')<cr>?<c-r>=@/<cr><cr>

"搜索完成后取消高亮
nnoremap <silent> <leader>nh :nohlsearch<cr>

"基于标签的代码导航
"正向遍历同名标签，先按Ctrl-]，再执行下面两个
nmap <leader>ta :tnext<cr>
"反向遍历同名标签
nmap <leader>tb :tprevious<cr>

"不改变当前窗口的模式，快速移动另外一个窗口及quickfix窗口的光标
noremap <silent><tab>[ :call Tools_QuickfixCursor(2)<cr>
noremap <silent><tab>] :call Tools_QuickfixCursor(3)<cr>
noremap <silent><tab>{ :call Tools_QuickfixCursor(4)<cr>
noremap <silent><tab>} :call Tools_QuickfixCursor(5)<cr>
noremap <silent><tab>u :call Tools_PreviousCursor(6)<cr>
noremap <silent><tab>d :call Tools_PreviousCursor(7)<cr>
inoremap <silent><tab>[ <c-\><c-o>:call Tools_QuickfixCursor(2)<cr>
inoremap <silent><tab>] <c-\><c-o>:call Tools_QuickfixCursor(3)<cr>
inoremap <silent><tab>{ <c-\><c-o>:call Tools_QuickfixCursor(4)<cr>
inoremap <silent><tab>} <c-\><c-o>:call Tools_QuickfixCursor(5)<cr>
inoremap <silent><tab>u <c-\><c-o>:call Tools_PreviousCursor(6)<cr>
inoremap <silent><tab>d <c-\><c-o>:call Tools_PreviousCursor(7)<cr>

if has("autocmd")
    autocmd BufWritePre *.txt,*.sh,*.tex :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 0:up, 1:down, 2:pgup, 3:pgdown 4:top, 5:bottom, 
function! Tools_QuickfixCursor(mode)
	function! s:quickfix_cursor(mode)
		if &buftype == 'quickfix'
			if a:mode == 0
				exec "normal! \<c-y>"
			elseif a:mode == 1
				exec "normal! \<c-e>"
			elseif a:mode == 2
				exec "normal! ".winheight('.')."\<c-y>"
			elseif a:mode == 3
				exec "normal! ".winheight('.')."\<c-e>"
			elseif a:mode == 4
				normal! gg
			elseif a:mode == 5
				normal! G
			elseif a:mode == 6
				exec "normal! \<c-u>"
			elseif a:mode == 7
				exec "normal! \<c-d>"
			elseif a:mode == 8
				exec "normal! k"
			elseif a:mode == 9
				exec "normal! j"
			endif
		endif
	endfunc
	let l:winnr = winnr()			
	noautocmd silent! windo call s:quickfix_cursor(a:mode)
	noautocmd silent! exec ''.l:winnr.'wincmd w'
endfunc

" 0:up, 1:down, 2:pgup, 3:pgdown, 4:top, 5:bottom
function! Tools_PreviousCursor(mode)
	if winnr('$') <= 1
		return
	endif
	noautocmd silent! wincmd p
	if a:mode == 0
		exec "normal! \<c-y>"
	elseif a:mode == 1
		exec "normal! \<c-e>"
	elseif a:mode == 2
		exec "normal! ".winheight('.')."\<c-y>"
	elseif a:mode == 3
		exec "normal! ".winheight('.')."\<c-e>"
	elseif a:mode == 4
		normal! gg
	elseif a:mode == 5
		normal! G
	elseif a:mode == 6
		exec "normal! \<c-u>"
	elseif a:mode == 7
		exec "normal! \<c-d>"
	elseif a:mode == 8
		exec "normal! k"
	elseif a:mode == 9
		exec "normal! j"
	endif
	noautocmd silent! wincmd p
endfunc

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunc

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunc

function! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunc
