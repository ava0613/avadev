###########
# 
#
export FZF_DEFAULT_OPTS="\
--preview 'bat --style=numbers --color=always --line-range :500 {}' \
--bind ctrl-p:preview-up,ctrl-n:preview-down,\
ctrl-b:preview-page-up,ctrl-f:preview-page-down,\
ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,\
ctrl-h:preview-top,ctrl-e:preview-bottom,\
alt-up:half-page-up,alt-up:half-page-down"

alias fff="fzf --bind 'enter:execute(nvim.appimage {})'"

alias cdava='cd '$HOME'/work/avadev'

### lazygit
alias llg='lazygit'                                                              
# start lazygit with a filter to the current dir or to a file/dir in the current dir  
lazygit_filtered()                                                                
{                                                                                
   lazygit -f $(pwd)/"$1"                                                        
}                                                                                
alias llh='lazygit_filtered'                                 

alias cdw='cd ~/work'

alias mc='mc -S modarin256.ini'

###########
# ATOM stuff
#
if [ -d $HOME'/work/atom' ]; then # in a dev env
    ATOM_ROOT=$HOME'/work/atom'                                                  
else # default atom machines
    ATOM_ROOT=$HOME'/atom'                                                  
fi

alias cda='cd $ATOM_ROOT'                                                        
alias cdaa='cd $(find $ATOM_ROOT -type d | fzf )'                                
# find the full path of a file wihin the atom project, regardless of your current path  
alias aff="find $ATOM_ROOT | fzf "                                                

alias agg="find $ATOM_ROOT | fzf --bind 'enter:execute(lazygit -f {})'"                                                  
#alias llh='get_git_dir | xargs lazygit -f'                                      

#########
# MT stuff

alias mtproxy="\
echo 'curl -x 172.28.18.8:3128  -U res\\vasarhely1a613  info.cern.ch'; 
curl -x 172.28.18.8:3128  -U res\\\\vasarhely1a613  info.cern.ch; 
echo 'curl -x 172.28.18.9:3128  -U res\\vasarhely1a613  info.cern.ch'; 
curl -x 172.28.18.9:3128 -U res\\\\vasarhely1a613  info.cern.ch"

nslookup directproxy.telekom.intra > /dev/null
if [ $? -eq 0 ] ; then # proxy foun, we are in MT environment
    export http_proxy=172.28.18.8:3128 
    export https_proxy=172.28.18.8:3128 
    export no_proxy=svn.nis.t-mobile.intra
else
    unset http_proxy https_proxy no_proxy
fi


