# dotfiles

dotfiles from home directory

## nvim

My configurations for neovim (at least version 0.7), neovide, neovim-qt files.

* Based on Lua.
* Mostly a port from my original vimscript.
* Original Lua configuration ideas taken from
  [Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)
* Further updates in 2025, based on less plugins, following the very good guide
  in [Neovim LSP Client Guide](https://vonheikemen.github.io/devlog/tools/neovim-lsp-client-guide/)
* The current configuration has diverged significantly from the setup in
  Neovim-from-scratch, with tons of custom functions. Example changes:

  * custom functions for finding top level git directory, Telescope search,
    Telescope find files
  * custom autocommands for setting background (dark / light) based on daylight.
    The daylight is determined based on timings (7 am to 7 pm), or optionally
    based on a file `~/.config/nvim/day_time_file.txt`. There is no
    configuration for this - the nvim configuration automatically falls back to
    7 am to 7 pm if this file is absent or if it is unable to be read correctly.
    The format of this file is - just one entry with four numbers, with the
    hours in 24 hour format:

    ```txt
    starthour startminute endhour endminute
    ```

    This file can be populated once a day or once a week using a cronjob. This
    command may take a couple of seconds to execute and hence it is not a good
    idea to run it from inside nvim. An example shell script that can be run
    from the cronjob is the following:

    ```sh
    #!/bin/sh
    # Substitude "<latitude>" and "<longitude>" below with the values at your
    # location. At present the location is a fixed value. If you are not roaming
    # around the world every other day then it is going to be fixed anyway
    url='https://api.sunrisesunset.io/json?lat=<latitude>&lng=<longitude>&time_format=24'
    curl -s -X GET "$url"   | \
        tr ',' '\n'         | \
        sed -n -e '/^"sun/s/^"sun.*:"\([0-9]\+\):\([0-9]\+\):.*$/\1 \2/p' | \
        tr '\n' ' ' > ~/.config/nvim/day_time_file.txt
    ```

  * custom setting for root vs normal user so that editor settings for root user
    is very distinctive.
  * custom functions for setting fonts based on whether I am working on my
    laptop and whether laptop is connected to (larger) external display
  * custom Lua functions for coc.nvim
  * ~~custom Lua based settings for cscope~~. Latest neovim does not have cscope
    support any more
  * custom setting for checking whether we are running in a terminal

## zsh-config

Zsh configuration files. Most of them are more than a decade old.
