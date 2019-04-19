" disable compatability
set nocompatible

" enable syntax highlighting
syntax enable

" show relative line numbers
set number relativenumber

" tabspaces = 4
set ts=4

" indent to the next line
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << shift lines by 4 spaces
set shiftwidth=4

" show visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" Spell Checking
autocmd BufRead,BufNewFile *.md set spell spelllang=en_us

call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-scriptease', {'type': 'opt'}
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Code Completion
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
else
   Plug 'Shougo/deoplete.nvim'
   Plug 'roxma/nvim-yarp'
   Plug 'roxma/vim-hug-neovim-rpc'
   Plug 'zchee/deoplete-jedi' 
endif

" Terminal Utils
Plug 'mklabs/split-term.vim'

" Languages
Plug 'pangloss/vim-javascript' " javascript
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } " Go
Plug 'vim-ruby/vim-ruby' " Ruby
Plug 'oranget/vim-csharp'
Plug 'OmniSharp/omnisharp-vim' " C#

" Frameworks
Plug 'tpope/vim-rails'

" Snippets
Plug 'SirVer/ultisnips' 

" Powerline/Airline Styling
Plug 'vim-airline/vim-airline'

" Syntax
Plug 'vim-syntastic/syntastic'

" Editor Utils
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'nathanaelkane/vim-indent-guides'

" Linting
Plug 'neomake/neomake'

" Comments
Plug 'tpope/vim-commentary'

call plug#end()

let NERDTreeShowHidden=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#syntastic#error_symbol = 'E:'
let g:airline#extensions#syntastic#stl_format_err = '%E{[%e(#%fe)]}'
let g:airline#extensions#syntastic#error_symbol = 'W:'
let g:airline#extensions#syntastic#stl_format_warn = '%W{[%w(#%fw)]}' 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:python_host_prog = 'C:\Python27\python'
let g:python3_host_prog = 'C:\Python37\python'
let g:deoplete#enable_at_startup = 1
let g:OmniSharp_server_type = 'roslyn' 
let g:OmniSharp_prefer_global_sln = 1  
let g:OmniSharp_timeout = 10      

let mapleder = ','

" Ctrl + f open file directory
map <C-f> :NERDTreeToggle<CR>
nnoremap <C-p> :<C-u>FZF<CR>
inoremap jk <Esc>

" Splitting
" nnoremap <C-J> <C-W><C-J> "Split down
" nnoremap <C-K> <C-W><C-K> "Split up
" nnoremap <C-L> <C-W><C-L> "Split right
" nnoremap <C-H> <C-W><C-H> "Split left
set splitbelow
set splitright