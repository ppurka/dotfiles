# dotfiles

dotfiles from home directory

## nvim

My configurations for neovim (at least version 0.7), neovide, neovim-qt files.

* Based on Lua.
* Mostly a port from my original vimscript.
* Original Lua configuration ideas taken from
  [Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)
* The current configuration has diverged significantly from the setup in
  Neovim-from-scratch, with tons of custom functions. Example changes:

  * custom functions for finding top level git directory, Telescope search,
    Telescope find files
  * custom autocommands for setting background (dark / light) based on daylight.
    The daylight is determined based on timings (7 am to 7 pm).
  * custom setting for root vs normal user so that editor settings for root user
    is very distinctive.
  * custom functions for setting fonts based on whether I am working on my
    laptop and whether laptop is connected to (larger) external display
  * custom Lua functions for coc.nvim
  * custom Lua based settings for cscope
  * custom setting for checking whether we are running in a terminal

## zsh-config

Zsh configuration files. Most of them are more than a decade old.
