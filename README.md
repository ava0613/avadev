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
- :checkhealth is useful
- for fzf to work from within neovim I had to do an fzf install, copyig fzf binaries was not enough
- TREESITTER - for better highlight, incremental select, folding
    - should work without (too much) local binaries
    - TSInstall python|lua|javascript  - if autoinstall is not enabled due to proxy/fw

TODO
- make an sh install script to copy files from avadev to their proper place
- also make an script to collect the files into avadev

some dev settings, vim, bashprofile, etc
ok

####################################
WSL+CISCO ANY CONNECT
------------------------------------
- WSL net does not work when using CiscoAnyConnect fot VPN
- this is a known issue, google: "wsl cisco anyconnect"
    - https://jamespotz.github.io/blog/how-to-fix-wsl2-and-cisco-vpn
    - https://github.com/sakai135/wsl-vpnkit
- SOLUTION
    - rewrite /etc/resolv.conf within ubuntu
        
        sudo unlink /etc/resolv.conf # this will unlink the default wsl2 resolv.conf

        # This config will prevent wsl2 from overwritting the resolve.conf file everytime
        # you start wsl2
        cat <<EOF | sudo tee -a /etc/wsl.conf
        [network]
        generateResolvConf = false
        EOF

        in win powersell find the nameservers and the searchdomains specific to your vpn:
        - nameservers :
            Get-DnsClientServerAddress -AddressFamily IPv4 | Select-Object -ExpandProperty ServerAddresses
        - searchdomains:
            Get-DnsClientGlobalSetting | Select-Object -ExpandProperty SuffixSearchList

        - back in ubuntu edit /etc/resolv.conf, add the namesservers and searchdomain from the
        above step. It should be sthg like this
         
            nameserver 10.201.63.10
            nameserver 172.28.18.1
            nameserver 80.244.99.36
            nameserver 80.244.99.37
            search res.hu.corp
    - in powershell,as admin - probably after each vpn login
        - Get-NetAdapter | Where-Object {$_.InterfaceDescription -Match "Cisco AnyConnect"} | Set-NetIPInterface -InterfaceMetric 6000
        - Restart-Service LxssManager
