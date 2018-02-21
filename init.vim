filetype off "required

" Auto installs plugin manager if not there. How cool is that!?
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"------------------------------------------------------------
call plug#begin()

"------------------------------------------------------------
" Base settings - this is a superset of tpope/vim-sensible
Plug 'sheerun/vimrc'

" hopefully a good colorscheme
Plug 'morhetz/gruvbox'

" syntax highlighting
Plug 'sheerun/vim-polyglot'

" never touch your statusline again
Plug 'vim-airline/vim-airline'

" Fuzzy file search
Plug 'ctrlpvim/ctrlp.vim'

" git stuff in vim
Plug 'tpope/vim-fugitive'

" add surround support (think braces/brackets/parens/xml tags)
Plug 'tpope/vim-surround'

" adds support for more commands to the vim repeat command '.'
Plug 'tpope/vim-repeat'

" completion
" Plug 'mtscout6/syntastic-local-eslint.vim'
" Plug 'valloric/youcompleteme'
" Plug 'ternjs/tern_for_vim'

" Snippets and templates
" You need to 'pip install neovim' for this to work in neovim
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'

" toggle mouse between vim/terminal
Plug 'nvie/vim-togglemouse'

" commenting
Plug 'tpope/vim-commentary'

"------------------------------------------------------------
" all of your plugins must be added before the following line
call plug#end()            " required

"------------------------------------------------------------
" Mappings

" In Vim, the mapleader or <leader> key is like a namespaced command key for
" user commands so that you don't accidentally override something important
" from the base Vim command set.
"
" By default it is '\', make it space because we are too lazy to reach that
" far and we like using both hands.
"
" Example: <leader>p is <leader> followed by 'p' within 1000ms
let mapleader = ' '

" <ESC> is kinda far away. And no one has ever typed 'jj' on purpose. So let's
" make that exit input mode too.
inoremap jj <ESC>

" <leader>-p should open CtrlP
nnoremap <leader>p :CtrlP<CR>

" Remaps for working with splits. Rather than doing Ctrl-W and then
" h/j/k/l to move to the window, just hit leader and then the direction
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" toggle paste mode with <leader>z
set pastetoggle=<leader>z


"------------------------------------------------------------
" Airline Settings
"
" Only enable this if you have powerline fonts installed
" see https://github.com/powerline/fonts
let g:airline_powerline_fonts = 1


"------------------------------------------------------------
" ctrlp settings
" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


"------------------------------------------------------------
" Color Settings
set background=dark
colorscheme gruvbox

" highlight 81st and 121st column
" See http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim for
" ctermbg value
highlight ColorColumn ctermbg=53
call matchadd('ColorColumn', '\%81v', 100)
call matchadd('ColorColumn', '\%121v', 100)


"------------------------------------------------------------
" Comment Settings
" see :h NERDCommenter

" ensure there's a space between the comment syntax and the actual comment
:let g:NERDSpaceDelims = 1


"------------------------------------------------------------
" WARNING: Potentially dangerous settings

" Automatically strip trailing whitespace just before save
autocmd BufWritePre * %s/\s\+$//e
