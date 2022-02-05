# Neovim (or Vim) config

## Setup
For [Neovim](https://github.com/neovim/neovim):

- See [the issue](https://github.com/wallw-bits/nvim-config/issues/1) regarding the automatic install
- `brew install neovim`
- clone to `~/.config/nvim`
- `pip install pynvim` (or pip3 if you like) for plugins using Python
- ensure [powerline fonts](https://github.com/powerline/fonts) are installed and set in [iTerm2](https://www.iterm2.com/) or whatever terminal you use
- if you want the same colorscheme in the terminal, check out [gruvbox-contrib](https://github.com/morhetz/gruvbox-contrib)

For Vim
- `brew install vim --with-override-system-vi`
- clone to `~/.vim`
- `ln -s ~/.vim/init.vim ~/.vimrc`

For both, follow instructions for neovim, and before opening either, run
```
ln -s ~/.config/nvim ~/.vim
ln -s ~/.config/nvim/init.vim ~/.vimrc
```

## Config
All the `.vim` files should be well-commented, so have a look. Note that `init.vim` (aka `.vimrc`) has the "potentially dangerous" command section at the bottom.
