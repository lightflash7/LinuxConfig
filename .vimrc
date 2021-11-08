"***********************************vim配置*************************************
"开启行号
set nu
"设置历史记录条数
set history=1000
"设置搜索时忽略大小写
set ignorecase
"设置在vim中可以使用鼠标
set mouse=a
"颜色256色
set t_Co=256
"智能缩进
set smartindent
"自动注释
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro




"******快捷键************
"切换buffer
nnoremap <C-p> :bn<ENTER>




"***********************************插件安装*************************************
call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'preservim/nerdcommenter'
  Plug 'jiangmiao/auto-pairs'
  Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension'  }
  Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop'  }
  "Plug 'ycm-core/YouCompleteMe'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


"***********************************插件配置**************************************
"**********************
"=>nerdtree
"***快捷键
" 开关
nnoremap <C-n> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>
"***配置
"是否显示隐藏文件
let NERDTreeShowHidden=1
"显示增强
"let NERDChristmasTree=1
"设置宽度
let NERDTreeWinSize=35
"显示行号
let NERDTreeShowLineNumbers=1
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
"显示书签列表
let NERDTreeShowBookmarks=1
"自动打开NERDTree如果没有打开文件
autocmd vimenter * if !argc() | NERDTree | endif
"自动调整焦点
"let NERDTreeAutoCenter=1
"在终端启动vim时，共享NERDTree
"let g:nerdtree_tabs_open_on_console_startup=1




"**********************
"=>airline
"***配置
"设置主题
"let g:airline_theme='cobalt2'
let g:airline_theme='light'
"开启标签
let g:airline#extensions#tabline#enabled = 1
"标签显示格式
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1  
"tabline中buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ''  
let g:airline#extensions#tabline#left_alt_sep = ''

"powerline symbols字体
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.dirty='⚡'


"**********************
"=>auto-pairs
"***配置
"插件打开关闭快捷键
imap <C-d>p <M-p>
"跳到下一层括号快捷键
imap <C-d>n <M-n>
"在文本前输入括号，然后使用改快捷键包围文本
imap <C-d>e <M-e>
"开启飞行模式和飞行模式快捷键(飞行模式用于避免在右括号括错地方时候的修正，因为按右括号是跳转到右括号)
let g:AutoPairsFlyMode = 1 
imap <C-d>b <M-b>


"**********************
"=>nerdcommenter
"***配置
nmap <C-\> <leader>c<Space>
vmap <C-\> <leader>c<Space>


"**********************
"=>vim-gitgutter
"***配置
"状态栏颜色
highlight clear SignColumn
"一直显示状态栏
"set signcolumn=yes
"异步运行，默认异步运行开
"let g:gitgutter_async = 0





"**********************
"=>Leaderf 
"***配置
"弹出窗口
let g:Lf_WindowPosition = 'popup'
"preview the result in a popup window
let g:Lf_PreviewInPopup = 1
"根目录配置
let g:Lf_WorkingDirectoryMode = 'AF'
let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']
"设置1则显示隐藏文件. 默认值0
let g:Lf_ShowHidden = 1
"窗口高度
let g:Lf_WindowHeight = 0.30


"***快捷键
"上下
let g:Lf_CommandMap = {'<C-k>': ['<Up>'], '<C-j>': ['<Down>']}
"调用快捷键
let g:Lf_ShortcutF = '<C-i>'
noremap ,f :LeaderfSelf<cr>
noremap ,fm :LeaderfMru<cr>
noremap ,ff :LeaderfFunction<cr>
noremap ,fb :LeaderfBuffer<cr>
noremap ,ft :LeaderfBufTag<cr>
noremap ,fl :LeaderfLine<cr>
noremap ,fw :LeaderfWindow<cr>
noremap ,frr :LeaderfRgRecall<cr>

"noremap ,fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
"noremap ,fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
"noremap ,ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
"noremap ,fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>




	




"**********************
"=>youcompleteme
"开启或关闭ycm
let g:ycm_auto_trigger=0 
"***配置
nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>                " turn off YCM
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>                "turn on YCM
"语义补全触发快捷键
let g:ycm_key_invoke_completion = '<c-k>'
"语义补全用两个字符触发
let g:ycm_semantic_triggers =  {
  \ 'c,cpp,python,java,go,erlang,perl':['re!\w{2}'],
  \ 'cs,lua,javascript':['re!\w{2}']
  \ }
"字符触发时字符个数
let g:ycm_min_num_identifier_candidate_chars = 2
"在注释输入中也能补全  
let g:ycm_complete_in_comments = 1  
"补全框颜色
highlight PMenu ctermfg=black ctermbg=lightblue
highlight PMenuSel ctermfg=black ctermbg=cyan
"禁止自动弹出解释含义的框框
set completeopt=menu,menuone  
let g:ycm_add_preview_to_completeopt = 0 





"**********************
"=>python-mode
"***配置
"是否关闭分界线
let g:pymode_options_colorcolumn = 1
"增加最大长度
let g:pymode_options_max_line_length = 100 



"**********************
"=>coc.nvim
"***配置
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.(会多一行在最下面，不太好看)
"set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

