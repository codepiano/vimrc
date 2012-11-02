colorscheme desert           " 着色模式
set guifont=inconsolata:h14  " 设置字体
set tabstop=4                " 设置tab键的宽度
set shiftwidth=4             " 换行时行间交错使用4个空格
set ambiwidth=double         " 设置处理东亚二义性宽度字符类，例如全角字符
set autoindent               " 自动对齐
set backspace=2              " 设置退格键可用
set cindent shiftwidth=4     " 自动缩进4空格
set smartindent              " 智能自动缩进
set ai!                      " 设置自动缩进
set nu!                      " 显示行号
"set showmatch               " 显示括号配对情况
set mouse=a                  " 启用鼠标
set ruler                    " 右下角显示光标位置的状态行
set ignorecase smartcase     " 忽略大小写检索
set hlsearch                 " 开启高亮显示结果
set incsearch                " 开启实时搜索功能
set nowrapscan               " 搜索到文件两端时不重新搜索
set lazyredraw               " 延迟重画
set nolinebreak              " 禁止强制折行
set winaltkeys=no            " 为了使用alt组合快捷键，禁止通过alt键操作菜单
"set cursorline               " 突出显示当前行
"set cuc                      " 突出显示当前列
set hidden                   " 允许在有未保存的修改时切换缓冲区
set writebackup              " 设置无备份文件
set nobackup
set autochdir                " 设定文件浏览器目录为当前目录
"set nowrap                  " 设置不自动换行
set foldmethod=syntax        " 选择代码折叠类型
set foldlevel=100            " 禁止自动折叠
set laststatus=2             " 开启状态栏信息
set cmdheight=2              " 命令行的高度，默认为1，这里设为2
set showcmd                  
set scrolloff=3              " 光标移动到buffer的顶部和底部时保持三行差距
set whichwrap+=b,s,[,]   " Backspace and cursor keys wrap to
set novisualbell             " 设置无响铃
"set list                     " 显示Tab符，使用一高亮竖线代替
"set listchars=tab:\|\ ,

syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全

"normal模式下取消输入法
autocmd! InsertLeave *	set imdisable
autocmd! InsertEnter *	set noimdisable

function! CurDir()
	let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
	return curdir
endfunction

"设置 mapleader = [
"注意，下列所有命令中的<leader>需替换为设置的符号
let g:mapleader = "["

"快速编辑vimrc
if has("win32")
	"Fast editing of _vimrc
	map <leader>e :e! $VIM/_vimrc<cr>
	"reload _vimrc
	map <leader>s :source $VIM/_vimrc<cr>
	"When .vimrc is edited, reload it
	autocmd! bufwritepost vimrc source /$VIM/_vimrc
elseif has("unix")
	"Fast editing of .vimrc
	map <leader>e :e! $HOME/.vimrc<cr>
	"reload _vimrc
	map <leader>s :source $HOME/.vimrc<cr>
	"When .vimrc is edited, reload it
	autocmd! bufwritepost vimrc source ~/.vimrc
endif

"文件格式
if has("win32")
	set ffs=dos,unix,mac
elseif has("unix")
	set ffs=unix,dos,mac
endif

"行尾补分号
imap ;; <ESC>$a;<ESC>
"Ctrl-S 保存文件
nmap <silent> <C-S> :update<CR>
map <silent> <C-S> <ESC>:update<CR>
vmap <silent> <C-S> <ESC>:update<CR>
"HTML转义
nnoremap <silent> [x :.HTMLEscape<CR>
nnoremap <silent> ]x :.HTMLUnescape<CR>
"清除高亮显示
map <F2> :nohl<cr>
"高亮所在行
map <F3> :set cursorline!<CR>
"高亮所在列
map <F4> :set cursorcolumn!<CR>
"可视模式下对选中模块进行复制C-c或剪切C-x
vmap <C-c> "+y
vmap <C-x> "+x
"插入模式下C-v粘贴
"<esc>切换到命令模式，:set paste切换vim到粘贴模式，<cr>相当于回车执行set命令
"mua<cr>设置一个标记u，然后执上行a命令在光标后插入，<C-R>+执行粘贴操作
"inoremap <C-v> <esc>:set paste<cr>mua<C-R>+<esc>mv'uV'v=:set nopaste<cr>
inoremap <C-v> <esc>:set paste<cr>mua<C-R>+<esc>:set nopaste<cr>

"快速存储和关闭
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>qq :q!<cr>
nmap <leader>wq :wq<cr>

"将当前内容在新标签中打开
map <leader>tn :tabnew %<cr> 
"打开空白新标签
map <leader>te :tabedit 
"关闭当前标签
map <leader>tc :tabclose<cr> 
"移动当前标签,使用方法为
map <leader>tm :tabmove 
"让 gvim 支持 Alt+n 来切换标签页
autocmd VimEnter * call BufPos_Initialize()

if has("gui_running")
    au GUIEnter * simalt ~x  " 窗口启动时自动最大化
    "winpos 20 20            " 指定窗口出现的位置，坐标原点在屏幕左上角
    "set lines=20 columns=90 " 指定窗口大小，lines为高度，columns为宽度
    "set guioptions-=m       " 隐藏菜单栏
    set guioptions-=T        " 隐藏工具栏
    "set guioptions-=L       " 隐藏左侧滚动条
    "set guioptions-=r       " 隐藏右侧滚动条
    "set guioptions-=b       " 隐藏底部滚动条
    "set showtabline=0       " 隐藏Tab栏
endif


" 每行超过80个的字符用下划线标示
au BufRead,BufNewFile *.asm,*.c,*.cpp,*.java,*.cs,*.sh,*.lua,*.pl,*.pm,*.py,*.rb,*.erb,*.hs,*.vim 2match Underlined /.\%81v/


" 设置编码
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
" 解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 解决consle输出乱码
language messages zh_CN.utf-8


" For Haskell
:let hs_highlight_delimiters=1            " 高亮定界符
:let hs_highlight_boolean=1               " 把True和False识别为关键字
:let hs_highlight_types=1                 " 把基本类型的名字识别为关键字
:let hs_highlight_more_types=1            " 把更多常用类型识别为关键字
:let hs_highlight_debug=1                 " 高亮调试函数的名字
:let hs_allow_hash_operator=1             " 阻止把#高亮为错误


" ======= 引号 && 括号自动匹配 ======= " 
:inoremap ( ()<ESC>i

:inoremap ) <c-r>=ClosePair(')')<CR>

:inoremap { {}<ESC>i

:inoremap } <c-r>=ClosePair('}')<CR>

:inoremap [ []<ESC>i

:inoremap ] <c-r>=ClosePair(']')<CR>

":inoremap < <><ESC>i

":inoremap > <c-r>=ClosePair('>')<CR>

:inoremap " ""<ESC>i

:inoremap ' ''<ESC>i

:inoremap ` ``<ESC>i

":nmap qq <ESC>yypk^i//<ESC>jf"lct"
":nmap qq yi<$a<td>&lt;<ESC>p$a&gt;</td><ESC>
":nmap qq yypk^i//<ESC>j^2f"ci"

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

"==============================================================================
" moving around
"==============================================================================
"切换窗口
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"nomal模式下tab来切换窗口
"nmap <tab> <C-W>w
",v 打开水平窗口
map <leader>v :vsplit<cr>


" MiniBufExplorer     多个文件切换 可使用鼠标双击相应文件名进行切换
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1

" :Tlist              调用TagList
let Tlist_Show_One_File=1                    " 只显示当前文件的tags
let Tlist_Exit_OnlyWindow=1                  " 如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Right_Window=1                 " 在右侧窗口中显示
let Tlist_File_Fold_Auto_Close=0             " 自动折叠

" TxtBrowser          高亮TXT文本文件
au BufRead,BufNewFile *.txt setlocal ft=txt

" :FencView           查看文件编码和更改文件编码
let g:fencview_autodetect=1

" :LoadTemplate       根据文件后缀自动加载模板
let g:template_path='D:\Program Files\Vim\vimfiles\template\'

" :AuthorInfoDetect   自动添加作者、时间等信息，本质是NERD_commenter && authorinfo的结合
let g:vimrc_author='codepiano'
let g:vimrc_email='codepiano@gmail.com'
let g:vimrc_homepage='http://pianoisy.sinaapp.com/'

" Ctrl + E            一步加载语法模板和作者、时间信息 [非插入模式]
map <c-1> <ESC>:LoadTemplate<CR><ESC>:AuthorInfoDetect<CR><ESC>Gi
vmap <c-1> <ESC>:LoadTemplate<CR><ESC>:AuthorInfoDetect<CR><ESC>Gi


" nt                  打开NERDTree [非插入模式]
map nt :NERDTree<CR>

" tl                  打开Taglist [非插入模式]
map tl :Tlist<CR><c-l>

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

" ======= 编译 && 运行 ======= "

" 编译C源文件
func! CompileGcc()
    exec "w"
    let compilecmd="!gcc -Wall -pedantic -std=c99 "
    let compileflag="-o %<"
    exec compilecmd." % ".compileflag
endfunc

" 编译C++源文件
func! CompileCpp()
    exec "w"
    let compilecmd="!g++ -Wall -pedantic -std=c++98 "
    let compileflag="-o %<"
    exec compilecmd." % ".compileflag
endfunc

" 编译Java源文件
func! CompileJava()
	exec "w"
    exec "!javac %"
endfunc

" 编译Haskell源文件
func! CompileHaskell()
	exec "w"
	let compilecmd="!ghc --make "
	let compileflag="-o %<"
	exec compilecmd." % ".compileflag
endfunc

" 根据文件类型自动选择相应的编译函数
func! CompileCode()
        exec "w"
        if &filetype == "c"
			exec "call CompileGcc()"
        elseif &filetype == "cpp"
			exec "call CompileCpp()"
		elseif &filetype == "java"
			exec "call CompileJava()"
		elseif &filetype == "haskell"
			exec "call CompileHaskell()"
		elseif &filetype == "lua"
			exec "!lua %<.lua"
		elseif &filetype == "perl"
			exec "!perl %<.pl"
        elseif &filetype == "python"
			exec "!python %<.py"
		elseif &filetype == "ruby"
			exec "!ruby %<.rb"
        endif
endfunc

" 运行可执行文件
func! RunResult()
        exec "w"
        if &filetype == "c"
			exec "! %<"
        elseif &filetype == "cpp"
			exec "! %<"
		elseif &filetype == "java"
			exec "!java %<"
		elseif &filetype == "haskell"
			exec "! %<"
		elseif &filetype == "lua"
			exec "!lua %<.lua"
		elseif &filetype == "perl"
			exec "!perl %<.pl"
        elseif &filetype == "python"
			exec "!python %<.py"
		elseif &filetype == "ruby"
			exec "!ruby %<.rb"
        endif
endfunc

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
"--------------------------------------------------------------------------------"
"设置zen-coding的快捷键
let g:user_zen_expandabbr_key = '<c-e>'
"设置将当前窗口文件转换为HTML时，强制打开所有折叠
let g:html_no_foldcolumn = 1
"使用该脚本产生 XHTML (XML 兼容的 HTML)
let g:html_use_xhtml = 1
