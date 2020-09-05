" ----------------------------------------
" Automatic installation of vim-plug, if it's not available
" ----------------------------------------
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
"-----------------------------------------

"-----------------------------------------
" Automatically install missing plugins on startup
"-----------------------------------------
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif
"-----------------------------------------

call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'mhinz/vim-startify'
Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

" Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'

Plug 'sheerun/vim-polyglot'

" Plug 'Shougo/neoinclude.vim'
" Plug 'jsfaint/coc-neoinclude'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/jsonc.vim'

" Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

Plug 'flazz/vim-colorschemes'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'

" Plugins: Delimate & Endwise closing things automatically -------------------
Plug 'Raimondi/delimitMate'

" Plug 'alvan/vim-closetag' "XML Tags
Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'

Plug 'samoshkin/vim-mergetool'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'airblade/vim-gitgutter'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'romainl/vim-devdocs'
Plug 'mbbill/undotree'

Plug 'ryanoasis/vim-devicons'

" GraphViz
" Plug 'wannesm/wmgraphviz.vim'
" Plug 'liuchengxu/graphviz.vim'

" Markdown
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
" Plug 'iamcco/markdown-preview.nvim'

Plug 'vimwiki/vimwiki'
Plug 'bronson/vim-trailing-whitespace'

Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

noremap ö [
noremap ä ]
noremap öö [[
noremap ää ]]

let g:coc_global_extensions = ["coc-explorer",
            \ "coc-json",
            \ "coc-prettier",
            \ "coc-snippets" ]

" Basic
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

set clipboard+=unnamedplus
set cursorline
"set cursorcolumn
"set nocursorcolumn

set noerrorbells

" Modular Configuration files
source ~/.dotfiles/vim-cfgs/start-screen.vim
source ~/.dotfiles/vim-cfgs/coc.vim
" source ~/.dotfiles/vim-cfgs/rnvimr.vim
source ~/.dotfiles/vim-cfgs/cocexp.vim
source ~/.dotfiles/vim-cfgs/statusbar.vim
source ~/.dotfiles/vim-cfgs/ultisnips.vim
source ~/.dotfiles/vim-cfgs/snippets.vim

"colorscheme xoria256
colorscheme znake
if &diff
  colorscheme sol
endif

"highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
"highlight CursorLine ctermbg=Yellow cterm=bold guibg=#2b2b2b
"highlight CursorColumn ctermbg=Yellow cterm=bold guibg=#2b2b2b
"highlight CocFloating ctermbg=8
"highlight Quote ctermbg=109 guifg=#83a598
"highlight Pmenu ctermfg=0 ctermbg=250 guifg=#000000 guibg=#404050

"Default values
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175

set fileencoding=utf-8
set termguicolors
set hidden

set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set expandtab

set backspace=indent,eol,start
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.config/nvim/undodir
set undofile

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

syntax on
set ruler
set number
set nowrap

" Status bar
set laststatus=2

" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

filetype plugin on

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" RipGrep
if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0

" let g:netrw_browse_split=2
" let g:netrw_banner = 0
" let g:netrw_winsize = 25

" Buffer / split control
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Buffer nav
noremap <leader>z :bp<CR>
"noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
"noremap <leader>w :bn<CR>

" Close buffer
noremap <leader>bd :bd<CR>

nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

nmap <C-p> :Files<CR>
nmap <C-P> :Rg<CR>

command! W w !sudo tee % > /dev/null
noremap H ^
noremap L $

" Search mappings: These wi
" ll make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Clear hilight with esc
nnoremap <esc> :noh<return><esc>

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

"highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight ALEError guifg=Red
highlight ALEErrorSign guifg=Red
highlight ALEWarningSign guifg=Yellow
highlight ALEInfoSign guifg=White
" Custom color highlight for virtual text
highlight LCErrorHighlight  ctermfg=203 guifg=#FF6E6E
highlight LCWarnHighlight   ctermfg=215 guifg=#FFB86C
highlight LCHintHighlight   ctermfg=142 guifg=#ABB2BF
highlight LCInfoHighlight   ctermfg=239 guifg=#44475A
let g:LanguageClient_diagnosticsDisplay = {
  \   1: {
  \       "name": "Error",
  \       "texthl": "ALEError",
  \       "signText": "",
  \       "signTexthl": "ALEErrorSign",
  \       "virtualTexthl": "LCErrorHighlight",
  \   },
  \   2: {
  \       "name": "Warning",
  \       "texthl": "ALEWarning",
  \       "signText": "",
  \       "signTexthl": "ALEWarningSign",
  \       "virtualTexthl": "LCWarnHighlight",
  \   },
  \   3: {
  \       "name": "Information",
  \       "texthl": "ALEInfo",
  \       "signText": "",
  \       "signTexthl": "ALEInfoSign",
  \       "virtualTexthl": "LCInfoHighlight",
  \   },
  \   4: {
  \       "name": "Hint",
  \       "texthl": "ALEInfo",
  \       "signText": "",
  \       "signTexthl": "ALEInfoSign",
  \       "virtualTexthl": "LCHinthighlight",
  \   },
  \ }


" Vim Hexokinase -------------------------------------------------------------
let g:Hexokinase_refreshEvents = ['InsertLeave']

let g:Hexokinase_optInPatterns = [
  \     'full_hex',
  \     'triple_hex',
  \     'rgb',
  \     'rgba',
  \     'hsl',
  \     'hsla',
  \     'colour_names'
  \ ]

let g:Hexokinase_highlighters = ['backgroundfull']

" Reenable hexokinase on enter
autocmd VimEnter * HexokinaseTurnOn

" Plugins: Dev-icons ---------------------------------------------------------

let g:WebDevIconsOS = 'Ubuntu'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


