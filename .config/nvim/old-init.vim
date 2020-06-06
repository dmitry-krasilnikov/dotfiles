" TODO try to set up :make for pylint/isort in Docker
" TODO try remapping mapleader to <Space> & ',' to maplocalleader (for filetype plugins)
" TODO check that Startify does not prevent languageserver from working
" TODO find a way to autoload project specific .nvimrc

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
" wal cannot work with that
" set termguicolors
set inccommand=split
set exrc
set secure
set undofile
set clipboard^=unnamedplus
set foldmethod=indent
set noshowmode
set fileencodings=ucs-bom,utf-8,default,cp1251,latin1

" set ripgrep as external grep tool
set grepprg=rg\ --vimgrep\ -S\ $*
set grepformat=%f:%l:%c:%m

let g:startify_session_persistence = 1
let g:startify_lists = [
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
" check whether it's needed
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
" Plug 'autozimu/LanguageClient-neovim', {
    " \ 'branch': 'next',
    " \ 'do': 'bash install.sh',
    " \ }
Plug 'ncm2/ncm2'
Plug 'dart-lang/dart-vim-plugin'
Plug 'stevearc/vim-arduino'
Plug 'thanthese/Tortoise-Typing'
Plug 'chrisbra/Colorizer'
Plug 'dylanaraps/wal.vim'
Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'
" Plug 'mhinz/vim-startify'
Plug 'tpope/vim-dispatch'
Plug 'janko/vim-test'
Plug '5long/pytest-vim-compiler'
Plug 'vimwiki/vimwiki'
Plug 'kalekundert/vim-coiled-snake'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace'
Plug 'liuchengxu/vim-which-key'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'jiangmiao/auto-pairs'
Plug 'Chiel92/vim-autoformat'
Plug 'RRethy/vim-illuminate'
Plug 'neovim/nvim-lsp'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
call plug#end()

colorscheme wal

" substitution for ',' because of the 'vim-which-key' plugin blocks it
nnoremap ,, ,

let mapleader = ","
call which_key#register(',', "g:which_key_map")
map Y y$
nnoremap <silent> <leader> :<c-u>WhichKey ','<CR>
nnoremap <leader><C-e> :e ~/.config/nvim/init.vim<cr>
nnoremap <leader><C-r> :e ~/.config/nvim/ginit.vim<cr>
nnoremap <Leader>uu :up<CR>
tnoremap <c-t> <c-\><c-n>
tmap <c-^> <c-t><c-^>
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
    autocmd FileType fzf set nonu nornu
    " TODO make it save only files with names or save them automatically to a
    " temp dir; also save on buf leave (most probably)
    " autocmd CursorHold,CursorHoldI * update
augroup END

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

"Plugin 'auto-pairs'
let g:AutoPairsFlyMode = 1

"Plugin 'vim-slime'
let g:slime_target = "neovim"

" Plugin 'fzf.vim'
nmap <Leader>fb :Buffers<CR>
nmap <Leader>/  :BLines<CR>
nmap <Leader>fg :GFiles<CR>
nmap <Leader>ff :Files<CR>
nmap <Leader>fs :GFiles?<CR>
nmap <Leader>fc :Rg<cr>class (<Left>
nmap <Leader>fd :Rg<cr>def (<Left>
nmap <Leader>fr :Rg<cr>
nmap <Leader>mk :Marks<CR>
nmap <Leader>mp :Maps<CR>
nmap <Leader>fcd :Commands<CR>
nmap <Leader>fct :Commits<CR>
nmap <Leader>fhc :History:<CR>
nmap <Leader>fhs :History/<CR>

inoremap <C-s> <Esc>gUiw`]a

" Plugin 'vimwiki'
let g:vimwiki_list = [{'auto_tags': 1}]

" Plugin 'vim-test'
let test#strategy = "dispatch"

" Plugin 'autohighlight'
set updatetime=500
highlight clear CursorAutoHighlight
highlight CursorAutoHighlight guibg=purple1

" Plugin 'tagbar'
let g:tagbar_left = 1
let g:tagbar_autoclose = 1
nmap <Leader>t :TagbarToggle<CR>

" Plugin 'vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" " Plugin 'LanguageClient-neovim'
" let g:LanguageClient_serverCommands = {
"     \ 'python': ['pyls'],
"     \ }
" function! LC_maps()
"     if has_key(g:LanguageClient_serverCommands, &filetype)
"         nnoremap <buffer> <F5> :call LanguageClient_contextMenu()<CR>
"         nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
"         nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
"         nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
"         nnoremap <buffer> <Leader>y :call LanguageClient#textDocument_formatting()<CR>
"     endif
" endfunction

" Plugin 'nvim-lsp'
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>

augroup lspautocmd
    autocmd!
    " Use LSP omni-completion in Python files.
    autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
augroup END

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

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" TODO escape regex special characters
nnoremap <Leader>qh :chistory<CR>
nnoremap <Leader>qn :cnewer<CR>
nnoremap <Leader>qN :colder<CR>
nnoremap <Leader>qg :grep ""<Left>
nnoremap <Leader>qp :grep -g "**/*.py" ""<Left>
nnoremap <Leader>qw "yyiw:grep "\b<C-R>y\b"<CR>:copen<CR>
nnoremap <Leader>qa "yyiw:grep "<C-R>y"<CR>:copen<CR>
vnoremap <Leader>qa "yy:grep "<C-R>y"<CR>:copen<CR>
nnoremap <Leader>qq :cc<CR>
nnoremap <Leader>qo :copen<CR>
nnoremap <Leader>qc :cclose<CR>

nnoremap <Leader>lh :lhistory<CR>
nnoremap <Leader>ln :lnewer<CR>
nnoremap <Leader>lN :lolder<CR>
nnoremap <Leader>lg :lgrep ""<Left>
nnoremap <Leader>lp :lgrep -g "**/*.py" ""<Left>
nnoremap <Leader>lw "yyiw:lgrep "\b<C-R>y\b"<CR>:lopen<CR>
nnoremap <Leader>la "yyiw:lgrep "<C-R>y"<CR>:lopen<CR>
vnoremap <Leader>la "yy:lgrep "<C-R>y"<CR>:lopen<CR>
nnoremap <Leader>ll :ll<CR>
nnoremap <Leader>lo :lopen<CR>
nnoremap <Leader>lc :lclose<CR>

" TODO fix regex for the ) & ] cases
call textobj#user#plugin('url', {
\   'url': {
\     'pattern': 'https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*',
\     'select': ['au', 'iu'],
\   },
\ })

function! OpenUrl()
    normal "9yau
    execute '!qutebrowser ' . shellescape(getreg('9'))
endfunction

nnoremap <Leader>ol :silent call OpenUrl()<CR>

nnoremap <Leader>uf :execute ":normal [pfw<Leader>cb"<CR>
nnoremap <Leader>uc :execute ":normal [pcw<Leader>cb"<CR>

" grep for pattern in vim's args
function! GrepArgs(pattern)
    exe "grep \"" .  a:pattern . "\"" join(argv(), " ")
endfunction
command! -nargs=1 GrepArgs call GrepArgs(<args>)

command! InsertSha256Sum read !head -n100 /dev/random | sha256sum | cut -f1 -d" "

" Django 1.7 upgrade
" {% cycle row1,row2 %} -> {% cycle 'row1' 'row2' %}
function! FixCycleTag()
    let n = 1
    let s:pattern = '{% cycle \(\(\w\+,\?\)\+\) %}'
    while n <= argc()
        exe "argument " . n
        " start at the last char in the file and wrap for the
        " first search to find match at start of file
        normal G$
        let flags = "w"
        while search(s:pattern, flags) > 0
            let s:line = getline('.')
            let s:matches = matchlist(s:line, s:pattern)
            let s:init_args = split(s:matches[1], ',')
            call map(s:init_args, '"''" . v:val . "''"')
            let s:result_args = join(s:init_args, ' ')
            call setline('.', substitute(s:line, s:matches[0], '{% cycle ' . s:result_args . ' %}', ""))
            let flags = "W"
        endwhile
        update
        let n = n + 1
    endwhile
endfunction

" Define prefix dictionary
let g:which_key_map =  {}

" Second level dictionaries:
" 'name' is a special field. It will define the name of the group, e.g., leader-f is the "+file" group.
" Unnamed groups will show a default empty string.

" =======================================================
" Create menus based on existing mappings
" =======================================================
" You can pass a descriptive text to an existing mapping.

" let g:which_key_map.f = { 'name' : '+fzf' }
" let g:which_key_map.f.g = 'git-files'
" let g:which_key_map.f.f = 'all-files'

let g:which_key_map.f = { 'name' : '+fzf' }
let g:which_key_map.f.g = 'git-files'
let g:which_key_map.f.f = 'all-files'

let g:which_key_map.l = { 'name' : '+location-grep' }
let g:which_key_map.l.a = 'cursor-all'
let g:which_key_map.l.w = 'cursor-word'
let g:which_key_map.l.p = 'prompt-python'
let g:which_key_map.l.g = 'prompt-all'

let g:which_key_map.g = { 'name' : '+git' }

lua << EOF
require'nvim_lsp'.pyls.setup{
  cmd = { "pipenv", "run", "pyls" }
}
require'nvim_lsp'.dartls.setup{
    cmd = { "dart", "/opt/dart-sdk/bin/snapshots/analysis_server.dart.snapshot", "--lsp" }
}
EOF

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
