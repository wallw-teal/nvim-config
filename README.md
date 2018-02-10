# Neovim (or Vim) config

## Setup
For [Neovim](https://github.com/neovim/neovim):

- `brew install neovim/neovim/neovim` <-- not a typo
- clone to `~/.config/nvim`
- `pip install neovim` (or pip3 if you like) for plugins using Python
- ensure [powerline fonts](https://github.com/powerline/fonts) are installed and set in [iTerm2](https://www.iterm2.com/)
- if you want the same colorscheme in the terminal, check out [gruvbox-contrib](https://github.com/morhetz/gruvbox-contrib)

For Vim
- `brew install vim --with-override-system-vi`
- clone to `~/.vim`
- `ln -s ~/.vim/init.vim ~/.vimrc`

## Config
All the `.vim` files should be well-commented, so have a look. Note that `init.vim` (aka `.vimrc`) has the "potentially dangerous" command section at the bottom.
