alias fff="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' \
--bind ctrl-p:preview-up,ctrl-n:preview-down,\
ctrl-b:preview-page-up,ctrl-f:preview-page-down,\
ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,\
ctrl-h:preview-top,ctrl-e:preview-bottom,\
alt-up:half-page-up,alt-up:half-page-down,\
'enter:execute(nvim {})'"

