"------------------------------------------------ 文件类型侦测和语法高亮
"加载pathogen插件
"非.vim目录的加载方法请参考pathogen的github readme
runtime bundle/vim-pathogen.git/autoload/pathogen.vim
execute pathogen#infect()

syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全
colorscheme solarized        " 着色模式

" 解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 解决consle输出乱码
language messages zh_CN.utf-8


"normal模式下取消输入法,会导致命令中无法输入中文,比如无法使用中文检索
"autocmd! InsertLeave *	set imdisable
"autocmd! InsertEnter *	set noimdisable

"------------------------------------------------ 自定义设置
set background=dark
set fileformats=unix,dos     " 文件格式
set nocompatible             " 禁止模仿vi
set fenc=utf-8               " 设置编码
set encoding=utf-8           " 设置编码
set backspace=2              " 设置退格键可用
set tabstop=4                " 设置tab键的宽度
set shiftwidth=4             " 换行时行间交错使用4个空格
set ambiwidth=double         " 设置处理东亚二义性宽度字符类，例如全角字符
set autoindent               " 自动对齐
set cindent shiftwidth=4     " 自动缩进4空格
set smartindent              " 智能自动缩进
set ai!                      " 设置自动缩进
set nu!                      " 显示行号
set foldmethod=syntax        " 选择代码折叠类型
set foldlevel=100            " 禁止自动折叠
set mouse=a                  " 启用鼠标
set ruler                    " 右下角显示光标位置的状态行
set ignorecase smartcase     " 忽略大小写检索
set hlsearch                 " 开启高亮显示结果
set incsearch                " 开启实时搜索功能
set nowrapscan               " 搜索到文件两端时不重新搜索
set lazyredraw               " 延迟重画
set nolinebreak              " 禁止强制折行
set winaltkeys=no            " 为了使用alt组合快捷键，禁止通过alt键操作菜单
set hidden                   " 允许在有未保存的修改时切换缓冲区
set writebackup              " 设置无备份文件
set nobackup                 " 设置无备份文件
set autochdir                " 设定文件浏览器目录为当前目录
set laststatus=2             " 开启状态栏信息
set cmdheight=2              " 命令行的高度，默认为1，这里设为2
set showcmd                  " 在屏幕最后一行显示 (部分的) 命令
set scrolloff=3              " 光标移动到buffer的顶部和底部时保持三行差距
set whichwrap+=b,s,[,]       " 使指定的左右移动光标的键在行首或行尾可以移到前一行或者后一行
set novisualbell             " 设置无响铃
set fileencodings=utf-8,gbk,cp936,latin-1

"------------------------------------------------ 自定义按键绑定
"设置 mapleader = ; 
"注意，下列所有命令中的<leader>需替换为设置的符号
let g:mapleader = ";"

"快速编辑vimrc
" 快速编辑<leader>e 重新装入<leader>s
if has("win32")
  map <leader>e :e! $VIM/_vimrc<cr>
  map <leader>s :source $VIM/_vimrc<cr>
  autocmd! bufwritepost vimrc source /$VIM/_vimrc
elseif has("unix")
  map <leader>e :e! $HOME/.vimrc<cr>
  map <leader>s :source $HOME/.vimrc<cr>
  autocmd! bufwritepost vimrc source ~/.vimrc
endif

"插入模式下在行尾补分号
imap <leader>; <ESC>$a;<ESC>

"HTML转义
nnoremap <silent> [x :.HTMLEscape<CR>
nnoremap <silent> ]x :.HTMLUnescape<CR>
"清除高亮显示
map <F2> :nohl<cr>
"高亮所在行
map <F3> :set cursorline!<CR>
"高亮所在列
map <F4> :set cursorcolumn!<CR>
"切换窗口
map <A-j> <C-W>j
map <A-k> <C-W>k
map <A-h> <C-W>h
map <C-h> <C-W>h
map <A-l> <C-W>l
map <C-l> <C-W>l
"nomal模式下tab来切换窗口
nmap <tab> <C-W>w
"<leader>v 竖直分割窗口
map <leader>v :vsplit<cr>

"------------------------------------------------ 标签操作
"让 gvim 支持 Alt+n 来切换标签页
autocmd VimEnter * call BufPos_Initialize()

"------------------------------------------------ 每行超过80个的字符用下划线标示
au BufRead,BufNewFile *.asm,*.c,*.cpp,*.java,*.cs,*.sh,*.lua,*.pl,*.pm,*.py,*.rb,*.erb,*.hs,*.vim 2match Underlined /.\%81v/

"------------------------------------------------ 插件设置
" Tagbar              按键绑定和设置
nmap <silent> <F8> :TagbarToggle<CR>
nmap <silent> <leader>tt :TagbarToggle<CR>
let g:tagbar_left = 0                                             " tagbar窗口显示在左边
let g:tagbar_width = 40                                           " tagbar窗口宽度
let g:tagbar_autoclose = 0                                        " 跳转后自动关闭tagbar窗口
let g:tagbar_autofocus = 0                                        " tagbar窗口打开后自动获得焦点
let g:tagbar_sort = 1                                             " tags排序
let g:tagbar_compact = 0                                          " 紧凑结构，例如不显示空行
let g:tagbar_indent = 2                                           " 缩进的宽度，默认为2
let g:tagbar_show_visibility = 1                                  " 显示方法可视化关键字
let g:tagbar_expand = 0                                           " 如果使用GUI版本VIM，对窗口进行扩展
let g:tagbar_singleclick = 0                                      " 使用单击代替双击进行tag跳转
let g:tagbar_foldlevel = 99                                       " 菜单折叠层级，大于该层级数的会被折叠
let g:tagbar_iconchars = ['▶', '▼']                             " Linux and Mac OS X默认折叠图标
let g:tagbar_autoshowtag = 0                                      " tag所在菜单被折叠时的行为，参见文档
let g:tagbar_systemenc = 'cp936'                                  " 解决编码问题，参见文档

" SuperTab            按键绑定和设置
let g:SuperTabDefaultCompletionType = "context"                   " 默认补全方式
let g:SuperTabContextDefaultCompletionType = "<c-p>"              " 如果context补全方式返回空，使用该补全
let g:SuperTabRetainCompletionDuration = "insert"                 " 决定当前补全类型保留时间
let g:SuperTabNoCompleteBefore = []                               " 在给定规则前不进行补全
let g:SuperTabNoCompleteAfter = ['^', '\s']                       " 在给定规则后不进行补全
let g:SuperTabMappingForward  = "<tab>"                           " 向前的按键绑定
let g:SuperTabMappingBackward = "<s-tab>"                         " 向后的按键绑定
let g:SuperTabMappingTabLiteral = '<c-tab>'                       " 插入tab符
let g:SuperTabLongestEnhanced = 0                                 " 最长匹配增强                     
let g:SuperTabLongestHighlight = 0                                " 高亮最长匹配，可以直接使用回车选择
let g:SuperTabCrMapping = 1                                       " 使用<cr>结束补全

" Nerd_commenter      按键绑定和设置
let g:NERDAllowAnyVisualDelims = 1                                " 允许在可视/可视行模式使用多块注释符
let g:NERDBlockComIgnoreEmpty = 1                                 " 强制可视块添加正确注释符
let g:NERDCommentWholeLinesInVMode = 0                            " 改变可视注释时的方法
let g:NERDCreateDefaultMappings = 1                               " 启用/禁用 默认键映射
let g:NERDDefaultNesting = 1                                      " 启用默认嵌套注释
let g:NERDMenuMode = 0                                            " 指定 NERD commenter 菜单显示的方式
let g:NERDLPlace = "[>"                                           " 嵌套注释时，指定placeholder左侧的分隔符。
let g:NERDRPlace = ">]"                                           " 嵌套注释时，指定placeholder右侧的分隔符。
let g:NERDUsePlaceHolders = 1                                     " 当嵌套注释时,指定那种文件类型可以使用 placeholders 的注释分隔符
let g:NERDRemoveAltComs = 1                                       " 告诉脚本是否在取消注释时移除可选的注释分隔符
let g:NERDRemoveExtraSpaces = 1                                   " 取消注释时总清除多余的空格
let g:NERDSpaceDelims = 1                                         " 当注释时是否在注释符周围添加空格,取消注释时是否删除这些空格
let g:NERDCompactSexyComs = 1                                     " 指定是否使用简洁风格 sexy 注释

" AuthorInfo          自动添加作者、时间等信息，依赖NERD_commenter
nmap <silent> <leader>ai :AuthorInfoDetect<cr>
let g:vimrc_author = 'codepiano'
let g:vimrc_email = 'codepiano@gmail.com'
let g:vimrc_homepage = 'http://www.weibo.com/anyexingchen'

" UltiSnips           按键绑定和设置
let g:UltiSnipsEditSplit = 'normal'                               " 编辑窗口打开方式
let g:UltiSnipsExpandTrigger = '<c-enter>'                        " 触发扩展
let g:UltiSnipsListSnippets = '<c-tab>'                           " 列出代码段
let g:UltiSnipsJumpForwardTrigger = '<c-j>'                       " 跳到前一个插入点
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'                      " 跳到后一个插入点
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snippets"]     " 自定义代码段位置，在runtimepath下搜寻

" solarized           颜色主题设置
let g:solarized_menu = 0                                          " 是否在菜单上显示快捷按钮
let g:solarized_termtrans = 0                                     " 终端模式中是否使用默认背景设置
let g:solarized_bold = 1                                          " 使用粗体
let g:solarized_underline = 1                                     " 使用下划线
let g:solarized_italic = 1                                        " 使用斜体
let g:solarized_termcolors = 256                                  " vim終端模式使用256色
let g:solarized_contrast = "normal"                               " 对比度等级
let g:solarized_visibility = "normal"                             " 空白字符是否可见
let g:solarized_diffmode = "normal"                               " vim diff模式
let g:solarized_hitrail = 0                                       " listchars是否增强显示


" buffergator         按键绑定和设置
let g:buffergator_viewport_split_policy = 'L'                     " 窗口位置
let g:buffergator_autodismiss_on_select = 1                       " 选择buffer后窗口是否关闭
let g:buffergator_autoexpand_on_split = 1                         " GUI模式下是否自动扩展
let g:buffergator_split_size = 40                                 " 窗口的高度或者宽度
let g:buffergator_vsplit_size = 40                                " 竖直分割的窗口的宽度
let g:buffergator_hplit_size = 20                                 " 水平分割的窗口的高度
let g:buffergator_sort_regime = 'bufnum'                          " 默认的buffer排序方式
let ffergator_display_regime = 'basename'                         " 默认的buffer显示名称
let g:buffergator_suppress_keymaps = 0                            " 是否使用插件默认的按键绑定

" ctrlp               按键绑定和设置
let g:ctrlp_map = '<c-c>'                                         " 普通模式下调用ctrlp的快捷键
let g:ctrlp_cmd = 'CtrlP'                                         " ctrlp快捷键调用的方法
let g:loaded_ctrlp = 0                                            " 是否启用插件
let g:ctrlp_by_filename = 1                                       " 按照文件名搜索
let g:ctrlp_regexp = 1                                            " 是否开启正则表达式搜索
let g:ctrlp_match_window_bottom = 1                               " ctrlp窗口是否在底部
let g:ctrlp_match_window_reversed = 1                             " 排序规则
let g:ctrlp_max_height = 20                                       " 窗口最大高度
let g:ctrlp_switch_buffer = 'Et'                                  " 如果文件已打开，跳转
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'                " 避免在插件|帮助|quickfix中打开
let g:ctrlp_tabpage_position = 'ac'                               " 新标签的位置
let g:ctrlp_working_path_mode = 'ra'                              " 路径规则
let g:ctrlp_root_markers = ['']                                   " 自定义marker
let g:ctrlp_use_caching = 1                                       " 是否使用cache
let g:ctrlp_clear_cache_on_exit = 1                               " 是否使用跨会话cache
let g:ctrlp_show_hidden = 0                                       " 是否搜索隐藏文件/夹
let g:ctrlp_max_files = 10000                                     " 搜索的最大文件数
let g:ctrlp_max_depth = 40                                        " 遍历的文件夹最大深度
let g:ctrlp_max_history = &history                                " 记录的最大历史数
let g:ctrlp_open_new_file = 'v'                                   " 新建文件位置
let g:ctrlp_open_multiple_files = 't'                             " 打开多个文件的方式 
let g:ctrlp_arg_map = 0                                           " 使用带参数的打开方式
let g:ctrlp_follow_symlinks = 0                                   " 是否显示符号链接
let g:ctrlp_lazy_update = 0                                       " 是否延迟刷新
let g:ctrlp_default_input = 0                                     " 默认输入

" vim-easymotion      按键绑定和设置
let g:EasyMotion_do_shade = 1                                     " 是否开启阴影
let g:EasyMotion_do_mapping = 1                                   " 是否开启默认键绑定
let g:EasyMotion_grouping = 1                                     " 分组方式
let g:EasyMotion_leader_key = '<Leader><Leader>'                  " leader





"删除空行
command -range=% -bar NoLine <line1>,<line2>g/^\s*$/d_|nohls
"某个 pattern 出现的次数
command -range=% -nargs=1 Count <line1>,<line2>s/<args>//gn|nohls
command -range=% -bar SBlank <line1>,<line2>s/\v(^\s*$\n){2,}/\r/g
"删除拖尾的空白
command -range=% -bar NoSpace <line1>,<line2>s/\s\+$//|nohls|normal ``
"ReadCommand读取命令内容并将其插入到当前光标下
command -nargs=1 -complete=command ReadCommand redir @">|exe "<args>"|normal $p:redir END<CR>
command -range -bar HTMLEscape <line1>,<line2>s/&/\&amp;/ge|<line1>,<line2>s/</\&lt;/ge|<line1>,<line2>s/>/\&gt;/ge
command -range -bar HTMLUnescape <line1>,<line2>s/&amp;/\&/ge|<line1>,<line2>s/&lt;/</ge|<line1>,<line2>s/&gt;/>/ge
"==============================================================================
" for lookupfile.vim
"==============================================================================
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
if filereadable("./tags")                "设置tag文件的名字
let g:LookupFile_TagExpr = '"./tags"'
endif

"用A-Num来切换标签
function! BufPos_ActivateBuffer(num)
	let l:count = 1
	for i in range(1, bufnr("$"))
		if buflisted(i) && getbufvar(i, "&modifiable")
			if l:count == a:num
				exe "buffer " . i
				return
			"endif
			let l:count = l:count + 1
		endif
	endfor
	echo "No buffer!"
endfunction

function! BufPos_Initialize()
	for i in range(0, 9)
		exe "map <M-" . i . "> " . i . "gt" 
	endfor
endfunction

" 在vim中使用<leader>F命令查询单词
function! Mydict()
	"执行sdcv命令查询单词的含义,返回的值保存在expl变量中
	let expl=system('sdcv -n ' . expand("<cword>"))
	"在每个窗口中执行后面的命令，判断窗口中打开的文件名是否是dict-tmp，如果是，则强制关闭该窗口
	windo if expand("%")=="dict-tmp" |q!|endif	
	"纵向分割窗口，宽度为25，新窗口的内容为dict-tmp文件的内容
	30vsp dict-tmp
	"设置查询结果窗口的属性，不缓存，不保留交换文件
	setlocal buftype=nofile bufhidden=hide noswapfile
	"将expl的内容显示到查询结果窗口
	1s/^/\=expl/
	"跳转回文本窗口
	wincmd p
endfunction
"按键绑定，将调用函数并执行
nmap <leader>f :call Mydict()<CR>
"--------------------------------------------------------------------------------"
"设置zen-coding的快捷键
let g:user_zen_expandabbr_key = '<c-e>'
"设置将当前窗口文件转换为HTML时，强制打开所有折叠
let g:html_no_foldcolumn = 1
"使用该脚本产生 XHTML (XML 兼容的 HTML)
let g:html_use_xhtml = 1
