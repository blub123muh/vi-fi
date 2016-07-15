VIFI_BASE=$( cd $(dirname "$0"); pwd -P)
echo "[vi-fi] Creating symlinks (force with -f)"
ln -snv "$@" $VIFI_BASE/vimrc ~/.vimrc
ln -snv "$@" $VIFI_BASE/vim ~/.vim
ln -snv "$@" $VIFI_BASE/gitconfig ~/.gitconfig
# ln -snv "$@" $VIFI_BASE/zshrc ~/.zshrc
ln -snv "$@" $VIFI_BASE/tmux.conf ~/.tmux.conf

echo "[vi-fi] Installing plugins with vim-plug"
vim -u $VIFI_BASE/vimrc +PlugInstall +qall
