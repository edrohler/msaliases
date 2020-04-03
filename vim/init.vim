filetype plugin on

" set rtp+=~/.fzf

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

" Map jk to <ESC>
inoremap jk <Esc>

" Map leader to ,
let mapleder = ','

" Splitting
" nnoremap <C-J> <C-W><C-J> "Split down
" nnoremap <C-K> <C-W><C-K> "Split up
" nnoremap <C-L> <C-W><C-L> "Split right
" nnoremap <C-H> <C-W><C-H> "Split left
set splitbelow
set splitright

" Python Env
" enable all Python syntax highlighting features
let python_highlight_all = 1
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
let g:python_host_prog = 'C:\Python27amd64'
let g:python3_host_prog = 'C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python37_64'

" Spell Checking
autocmd BufRead,BufNewFile *.md set spell spelllang=en_us

call plug#begin('~/AppData/Local/nvim/plugged')
    Plug 'vim-airline/vim-airline'  " Powerline/Airline Styling
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }  " File viewer
    Plug 'tpope/vim-unimpaired' " Bracket mapping
    Plug 'tpope/vim-scriptease', {'type': 'opt'}    " Vim Script Editing
    Plug 'jeffkreeftmeijer/vim-numbertoggle'    " Toggles relative numbers
    Plug 'vim-syntastic/syntastic'  " Syntax
    Plug 'tpope/vim-surround'   " Surrounding pairs mapping
    Plug 'ctrlpvim/ctrlp.vim'   "   Fuzzy File Search
    " Plug 'junegunn/fzf.vim', { 'dir': '~/.fzf', 'do': './install --all' } "   Fuzzy File Search
    Plug 'nathanaelkane/vim-indent-guides'  " Indent
    Plug 'mklabs/split-term.vim'    " Terminal splitting
    Plug 'SirVer/ultisnips' " Snippets
    Plug 'neomake/neomake'  " Linting
    Plug 'tpope/vim-commentary' " Comments

    " Git integration
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Code Completion
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif

    Plug 'mattn/emmet-vim' " HTML editing

    " Languages
    Plug 'pangloss/vim-javascript' " javascript
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } " Go
    Plug 'vim-ruby/vim-ruby' " Ruby
    Plug 'oranget/vim-csharp' " C#

    " Compilers
    Plug 'OmniSharp/omnisharp-vim' " C#

    " Frameworks
    Plug 'tpope/vim-rails'

call plug#end()

" NERDTree
let NERDTreeShowHidden=1
" Ctrl + f open file directory
map <C-f> :NERDTreeToggle<CR>
" nnoremap <C-p> :<C-u>FZF<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#syntastic#error_symbol = 'E:'
let g:airline#extensions#syntastic#stl_format_err = '%E{[%e(#%fe)]}'
let g:airline#extensions#syntastic#error_symbol = 'W:'
let g:airline#extensions#syntastic#stl_format_warn = '%W{[%w(#%fw)]}' 

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Deoplete
let g:deoplete#enable_at_startup = 1

" OmniSharp
let g:OmniSharp_selector_ui = 'ctrlp'
let g:OmniSharp_server_type = 'roslyn' 
let g:OmniSharp_prefer_global_sln = 1  
let g:OmniSharp_timeout = 10
let g:OmniSharp_highlight_types = 1
augroup omnisharp_commands
    autocmd!

    " When Syntastic is available but not ALE, automatic syntax check on events
    " (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " Update the highlighting whenever leaving insert mode
    autocmd InsertLeave *.cs call OmniSharp#HighlightBuffer()

    " Alternatively, use a mapping to refresh highlighting for the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>th :OmniSharpHighlightTypes<CR>

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>    
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Enable snippet completion
" let g:OmniSharp_want_snippet=1