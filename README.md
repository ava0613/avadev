# avadev

- install nvim, fzf, delta, ripgrep, abt - musl binaries included here for the case your dist does not have them
  - lazygit, forgit
- for redhat: git build from source ,because lazygit needs git 2.x.x
- howto git proxy, nvim-proxy, github proxy
- nvim
    - plugins install
        - do not copy dirs,rather install from the web
        - in the vim.ini add the Plug .... directive
        - have the https_proxy env var set
        - from within nvim :PlugInstall or :PlugUpdate

INSTALL NEOVIM
- download and install neovim.appimage 
- plugins might not work out of the box (plug#begin error with init.vim):
    - sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    - then run :plugupdate, :pluginstall
- for fzf to work from within neovim I had to do an fzf install, copyig fzf binaries was not enough

TODO
- make an sh install script to copy files from avadev to their proper place
- also make an script to collect the files into avadev

some dev settings, vim, bashprofile, etc
ok
