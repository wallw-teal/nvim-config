"------------------------------------------------------------
" Javascript Settings

" Syntastic Settings
" vim-airline takes care of the statusline so don't worry about that 

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" javascript plugin
let g:javascript_plugin_jsdoc = 1

"------------------------------------------------------------
" Mappings - Javascript

" Use '<leader>sr' to sort goog.require statements
nnoremap <leader>sr vip:sort<CR>

