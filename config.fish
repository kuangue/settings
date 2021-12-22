export LSCOLORS=cxfxcxdxbxegedabagacad
set PATH $HOME/bin $PATH
# ローカルでの設定の仕方。
# set PATH $HOME/.pyenv/bin $PATH
# set PATH $HOME/bin $PATH
#. (pyenv init - | psub)
#set -g fish_user_paths "/usr/local/opt/sqlite/bin" $fish_user_paths
#. (pyenv virtualenv-init - | psub)
status is-login; and pyenv init --path | source
pyenv init - | source

export FLASK_APP=flaskr
export FLASK_ENV=development
