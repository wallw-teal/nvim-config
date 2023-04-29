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

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'codechips/coc-svelte', {'do': 'npm install'}

Plug 'fannheyward/coc-rust-analyzer', {'do': 'yarn install'}

Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

Plug 'github/copilot.vim'

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

" <ESC> is kinda far away. And no one has ever typed 'jk' on purpose. So let's
" make that exit input mode too.
inoremap jk <ESC>
inoremap kj <ESC>

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

" Use system clipboard for yank/put
set clipboard=unnamedplus

" Bring search results to midscreen
nnoremap n nzz
nnoremap N Nzz

" Keep at least 5 lines of context when moving near the top/bottom
set scrolloff=5

" I accidentally use macros way more than I intentionally use macros
nnoremap Q @q

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
au BufWritePre *.css,*.svelte,*.pcss,*.html,*.ts,*.tsx,*.js,*.jsx,*.json PrettierAsync

"------------------------------------------------------------
" COC Settings

nmap ff <Plug>(coc-format-selected)
nmap rn <Plug>(coc-rename)
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)

set updatetime=300
set shortmess+=c " don't give |ins-completion-menu| messages.

" Use <leader>d to show documentation in preview window
nnoremap <leader>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

function! SplitIfNotOpen(...)
  let fname = a:1
  let call = ''
  if a:0 == 2
    let fname = a:2
    let call = a:1
  endif
  let bufnum=bufnr(expand(fname))
  let winnum=bufwinnr(bufnum)
  if winnum != -1
    " Jump to existing split
    exe winnum . "wincmd w"
  else
    " Make new split as usual
    exe "vsplit " . fname
  endif
  " Execute the cursor movement command
  exe call
endfunction

command! -nargs=+ CocSplitIfNotOpen :call SplitIfNotOpen(<f-args>)

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
