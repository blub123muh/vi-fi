VIFI_BASE=$( cd $(dirname "$0"); pwd -P)
echo "[vi-fi] Installing plugins with vim-plug"
vim -u $VIFI_BASE/vimrc +PlugInstall +qall

echo "[vi-fi] Creating symlinks (force with -f)"
ln -snv "$@" $VIFI_BASE/vimrc ~/.vimrc
ln -snv "$@" $VIFI_BASE/vim ~/.vim
ln -snv "$@" $VIFI_BASE/gitconfig ~/.gitconfig
