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

" .editorconfig file support
Plug 'editorconfig/editorconfig-vim'

" syntax highlighting
Plug 'sheerun/vim-polyglot'

" never touch your statusline again
Plug 'vim-airline/vim-airline'

" Fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
let g:fzf_command_prefix = 'Fzf'

" git stuff in vim
Plug 'tpope/vim-fugitive'

" add surround support (think braces/brackets/parens/xml tags)
Plug 'tpope/vim-surround'

" adds support for more commands to the vim repeat command '.'
Plug 'tpope/vim-repeat'

" commenting
Plug 'tpope/vim-commentary'

" Snippets and templates
" You need to 'pip install neovim' for this to work in neovim
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'

" *******************************
" Language Server and Formatting Plugins
Plug 'prettier/vim-prettier', {'do': 'npm install'}

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'lighttiger2505/deoplete-vim-lsp'

let g:elixir_exists = executable('mix') && executable('elixirc')
if (g:elixir_exists)
  " Install and compile elixirls, which is referenced in coc-settings.json
  Plug 'GrzegorzKozub/vim-elixirls', { 'do': ':ElixirLsCompileSync' }
endif
" *******************************

" hopefully a good colorscheme
Plug 'morhetz/gruvbox'

"------------------------------------------------------------
" all of your plugins must be added before the following line
call plug#end()            " required

"------------------------------------------------------------
" Wild Menu
set wildignore=*/node_modules,*/.git

"------------------------------------------------------------
" For neovim, incrementally highlight and replace when
" running %s/needle/replacment/
if has('nvim')
  set inccommand=nosplit
endif

"------------------------------------------------------------
" Mappings

" In Vim, the mapleader or <leader> key is like a namespaced command key for
" user commands so that you don't accidentally override something important
" from the base Vim command set.
"
" By default it is '\', make it space because we are too lazy to reach that
" far and we like using both hands.
"
" The sheerun/vimrc plugin sets this to space when the plugin loads.
"
" Example: <leader>p is <leader> followed by 'p' within 1000ms

" <ESC> is kinda far away. And no one has ever typed 'jj' on purpose. So let's
" make that exit input mode too.
inoremap jj <ESC>

" <leader>g should open fzf for all files tracked by git
nnoremap <leader>g :FzfGFiles<CR>

" <leader>o should open fzf for all files
nnoremap <leader>o :FzfFiles<CR>

" <leader>f should run fzf with ripgrep for file search by content
nnoremap <leader>f :FzfRg<CR>

" Remaps for working with splits. Rather than doing Ctrl-W and then
" h/j/k/l to move to the window, just hit leader and then the direction
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" system clipboard yank and put
" Note: this requires vim to be built with the +clipboard feature flag
" run :echo has('clipboard') to see if you have it

" Copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

"------------------------------------------------------------
" Airline Settings
"
" Only enable this if you have powerline fonts installed
" see https://github.com/powerline/fonts
let g:airline_powerline_fonts = 1

"------------------------------------------------------------
" Performance Settings
"
" Don't bother highligting anything over 200 chars
set synmaxcol=200

"------------------------------------------------------------
" Prettier Settings
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat_require_pragma = 0
au BufWritePre *.css,*.svelte,*.pcss,*.html,*.ts,*.js,*.json PrettierAsync

"------------------------------------------------------------
" vim-lsp settings

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"------------------------------------------------------------
" Svelte highlighting
" The vim-svelte-plugin is added by vim-polyglot
"
" highlight TypeScript for <script lang="ts">
let g:vim_svelte_plugin_use_typescript = 1
" highlight sass/scss for <style lang="scss">
let g:vim_svelte_plugin_use_sass = 1

"------------------------------------------------------------
" Color Settings
if has('termguicolors')
  set termguicolors
endif

" Note: the actual colorscheme is set in after/plugins/colorscheme.vim
" to ensure we overwrite any potential colorschemes from plugins with ours

" highlight 81st and 121st column
" See http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim for
" ctermbg value
highlight ColorColumn ctermbg=53
call matchadd('ColorColumn', '\%81v', 100)
call matchadd('ColorColumn', '\%121v', 100)

"------------------------------------------------------------
" WARNING: Potentially dangerous settings

" Automatically strip trailing whitespace just before save
autocmd BufWritePre * %s/\s\+$//e
