call plug#begin('~/.local/share/nvim/plugged')
Plug 'vimwiki/vimwiki'
" Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'
" Plug 'dylanaraps/wal.vim'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Chiel92/vim-autoformat'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/graphviz.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/Colorizer'
Plug 'axelf4/vim-strip-trailing-whitespace'
Plug 'sainnhe/sonokai'
call plug#end()

set termguicolors

" TextEdit might fail if hidden is not set.
set hidden

set expandtab
set shiftwidth=4
set shiftround
set number
set relativenumber
set noswapfile
set ignorecase
set smartcase
set smartindent
set nohlsearch
set shell=/bin/zsh
set wrap
set inccommand=split
set exrc
set secure
set undofile
set clipboard^=unnamedplus
set foldmethod=indent
set noshowmode
set fileencodings=ucs-bom,utf-8,default,cp1251,latin1

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" the configuration options should be placed before `colorscheme sonokai`
let g:sonokai_style = 'maia'
let g:sonokai_enable_italic = 1
" let g:sonokai_disable_italic_comment = 1
let g:sonokai_transparent_background = 1
colorscheme sonokai

let g:airline_theme = 'sonokai'

" Plugin 'vimwiki'
let g:vimwiki_list = [{'auto_tags': 1}]

let mapleader = ","

"Plugin 'auto-pairs'
let g:AutoPairsFlyMode = 1

" Plugin 'vim-fugitive'
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gp :Gpush<CR>
nmap <Leader>gf :Gfetch<CR>
nmap <Leader>gmm :Gmerge origin/master<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gb :Gblame<CR>
nnoremap <Leader>gdh :diffget //2<CR>
nnoremap <Leader>gdl :diffget //3<CR>

" Plug markdown-preview
nmap <Leader>md <Plug>MarkdownPreviewToggle

function! OpenMarkdownPreview(url)
    silent execute "!chromium --app=" . a:url
endfunction
" a custom vim function name to open preview page
" this function will receive url as param
let g:mkdp_browserfunc = 'OpenMarkdownPreview'
" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 0

" Mappings
map Y y$
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <leader><C-e> :e ~/.config/nvim/init.vim<cr>
nnoremap <leader><C-s> :CocConfig<cr>
nnoremap <leader><C-l> :CocLocalConfig<cr>
nnoremap <Leader>ss :up<CR>

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
tnoremap <A-g> <C-\><C-N>5<C-w>>
tnoremap <A-f> <C-\><C-N>5<C-w>+
tnoremap <A-d> <C-\><C-N>5<C-w>-
tnoremap <A-s> <C-\><C-N>5<C-w><
tnoremap <A-m> <C-\><C-N><C-w>_
tnoremap <A-w> <C-\><C-N><C-w>\|
tnoremap <A-q> <C-\><C-N><C-w>q
tnoremap <A-n>v <C-\><C-N>:vnew<cr>
tnoremap <A-n> <C-\><C-N>:new<cr>
tnoremap <A-v> <C-\><C-N><C-w>v
tnoremap <A-b> <C-\><C-N><C-w>s
tnoremap <A-e> <C-\><C-N><C-w>=
tnoremap <A-o> <C-\><C-N>:only<cr>
tnoremap <A-r> <C-\><C-N><C-w>r

inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-g> <C-\><C-N>5<C-w>>
inoremap <A-f> <C-\><C-N>5<C-w>+
inoremap <A-d> <C-\><C-N>5<C-w>-
inoremap <A-s> <C-\><C-N>5<C-w><
inoremap <A-m> <C-\><C-N><C-w>_
inoremap <A-w> <C-\><C-N><C-w>\|
inoremap <A-q> <C-\><C-N><C-w>q
inoremap <A-n>v <C-\><C-N>:vnew<cr>
inoremap <A-n> <C-\><C-N>:new<cr>
inoremap <A-v> <C-\><C-N><C-w>v
inoremap <A-b> <C-\><C-N><C-w>s
inoremap <A-e> <C-\><C-N><C-w>=
inoremap <A-o> <C-\><C-N>:only<cr>
inoremap <A-r> <C-\><C-N><C-w>r

nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-g> 5<C-w>>
nnoremap <A-f> 5<C-w>+
nnoremap <A-d> 5<C-w>-
nnoremap <A-s> 5<C-w><
nnoremap <A-m> <C-w>_
nnoremap <A-w> <C-w>\|
nnoremap <A-q> <C-w>q
nnoremap <A-n>v :vnew<cr>
nnoremap <A-n> :new<cr>
nnoremap <A-v> <C-w>v
nnoremap <A-b> <C-w>s
nnoremap <A-e> <C-w>=
nnoremap <A-o> :only<cr>
nnoremap <A-r> <C-w>r

" grep word under cursor
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> <Leader>lw :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>

vnoremap <leader>lv :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
nnoremap <leader>lv :<C-u>set operatorfunc=<SID>GrepFromSelected<CR>g@

function! s:GrepFromSelected(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute 'CocList grep '.word
endfunction

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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
" TODO: fix this mapping or replacewith plugin's mapping
nmap <silent> gf <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <space>t  <Plug>(coc-format-selected)
nmap <space>t  <Plug>(coc-format-selected)

augroup vimrc
    autocmd!
    autocmd TermOpen * setlocal foldcolumn=0 number relativenumber
    autocmd TermOpen * startinsert
    autocmd BufEnter,BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert
    " autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
    " autocmd FileType * call LC_maps()
    autocmd BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile
    autocmd BufNewFile,BufRead /dev/shm/pass.* setlocal noswapfile nobackup noundofile
    autocmd FileType which_key set laststatus=0 noshowmode noruler foldcolumn=0
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler foldcolumn=4
    " autocmd FileType fzf set nonu nornu
    " TODO make it save only files with names or save them automatically to a
    " temp dir; also save on buf leave (most probably)
    " autocmd CursorHold,CursorHoldI * update
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

" " Plugin 'fzf.vim'
" nmap <Leader>fb :Buffers<CR>
" nmap <Leader>/  :BLines<CR>
" nmap <Leader>fg :GFiles<CR>
" nmap <Leader>ff :Files<CR>
" nmap <Leader>fs :GFiles?<CR>
" nmap <Leader>fc :Rg<cr>class :<Left>
" nmap <Leader>fd :Rg<cr>def (<Left>
" nmap <Leader>fr :Rg<cr>
" nmap <Leader>mk :Marks<CR>
" nmap <Leader>mp :Maps<CR>
" nmap <Leader>fcd :Commands<CR>
" nmap <Leader>fct :Commits<CR>
" nmap <Leader>fhc :History:<CR>
" nmap <Leader>fhs :History/<CR>

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
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

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
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

nmap <space>e :CocCommand explorer<CR>
" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>l  :<C-u>CocList<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
nnoremap <silent> <space>g  :<C-u>CocList grep<CR>
nnoremap <silent> <space>b  :<C-u>CocList buffers<CR>
nnoremap <silent> <space>/  :<C-u>CocList lines<CR>
nnoremap <silent> <space>f  :<C-u>CocList files<CR>

" " TODO confirm that it's actually working
" function! OpfuncSteady()
"   if !empty(&operatorfunc)
"     call winrestview(w:opfuncview)
"     unlet w:opfuncview
"     noautocmd set operatorfunc=
"   endif
" endfunction

" augroup OpfuncSteady
"   autocmd!
"   autocmd OptionSet operatorfunc let w:opfuncview = winsaveview()
"   autocmd CursorMoved * call OpfuncSteady()
" augroup END
