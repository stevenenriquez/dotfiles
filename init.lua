-- ~/.config/nvim/init.lua

-- add existing paths and .vimrc to the nvim config
vim.cmd('set runtimepath^=~/.vim runtimepath+=~/.vim/after') 
vim.o.packpath = vim.o.runtimepath
vim.cmd('source ~/.vimrc')
