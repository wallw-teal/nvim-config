# nvim-config

Adapted from [nvim-lsp-typescript-config](https://github.com/albingroen/nvim-lsp-typescript-config).

Only for [Neovim](https://github.com/neovim/neovim). Vim not supported.

1. `brew install neovim tree-sitter`
1. Install [Packer](https://github.com/wbthomason/packer.nvim)
1. Run `:PackerSync`
1. `npm i -g typescript-language-server svelte-language-server` (and whichever
   others you would like to use in `lua/lsp`)

if you want the same colorscheme in the terminal, check out
[gruvbox-contrib](https://github.com/morhetz/gruvbox-contrib)
