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
" -----------------------------------------

" -----------------------------------------
" Automatically install missing plugins on startup
" -----------------------------------------
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif

" -----------------------------------------

call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'sheerun/vim-polyglot'

Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh', }

" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'Shougo/echodoc.vim'

Plug 'neoclide/jsonc.vim'

Plug 'tomasr/molokai'
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
Plug 'tpope/vim-endwise'
Plug 'alvan/vim-closetag' "XML Tags
Plug 'tpope/vim-surround'

"Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'

Plug 'samoshkin/vim-mergetool'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'airblade/vim-gitgutter'

Plug 'romainl/vim-devdocs'
Plug 'mbbill/undotree'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Basic
let mapleader=' '
set noerrorbells
colorscheme xoria256
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
set undodir=~/.config/nvim/undodir
set undofile

" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

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
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>
" Close buffer
noremap <leader>c :bd<CR>

noremap <leader>u :UndotreeShow<CR>

nnoremap <Leader>pt :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>

nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

nmap <C-p> :Files<CR>
nmap <C-P> :Rg<CR>

command! W w !sudo tee % > /dev/null
noremap L $

" Search mappings: These wi
" ll make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Clear hilight with esc
nnoremap <esc> :noh<return><esc>

" vim-airline
let g:airline_powerline_fonts = 0
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"
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

" *****************************************************************************
" LanguageClient-neovim
" *****************************************************************************
" Enable for debug purposes if needed:
let g:LanguageClient_loggingFile = '/tmp/lc.log'
let g:LanguageClient_loggingLevel = 'DEBUG'


let g:LanguageClient_serverCommands = { 'rust': ['rust-analyzer'], }
let g:LanguageClient_autoStart = 1
let g:LanguageClient_rootMarkers = { 'rust': ['.git', 'Cargo.toml'] }   

let g:LanguageClient_diagnosticsDisplay = {
  \   1: {
  \       "name": "Error",
  \       "texthl": "ALEError",
  \       "signText": "",
  \       "signTexthl": "ErrorMsg",
  \   },
  \   2: {
  \       "name": "Warning",
  \       "texthl": "ALEWarning",
  \       "signText": "",
  \       "signTexthl": "ALEWarningSign",
  \   },
  \   3: {
  \       "name": "Information",
  \       "texthl": "ALEInfo",
  \       "signText": "",
  \       "signTexthl": "ALEInfoSign",
  \   },
  \   4: {
  \       "name": "Hint",
  \       "texthl": "ALEInfo",
  \       "signText": "",
  \       "signTexthl": "ALEInfoSign",
  \   },
  \ }

call deoplete#enable()
call deoplete#custom#source('LanguageClient', 'min_pattern_length', 2)

" Vim Hexokinase
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

"EHDOCK
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

"LSPC
function SetLSPShortcuts()
  nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>

  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader> rn :call LanguageClient#textDocument_rename()<CR> 

  nnoremap <F2> :call LanguageClient#textDocument_rename()<CR>
  nnoremap <F5> :call LanguageClient_contextMenu()<CR>
endfunction()

augroup LSP
  autocmd!
  autocmd FileType rust call SetLSPShortcuts()
augroup END

" Plugins: Dev-icons ---------------------------------------------------------

let g:WebDevIconsOS = 'Ubuntu'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''


