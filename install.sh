VIFI_BASE=$( cd $(dirname "$0"); pwd -P)
echo "[vi-fi] Creating symlinks (force with -f)"
ln -snv "$@" $VIFI_BASE/vimrc ~/.vimrc
ln -snv "$@" $VIFI_BASE/vim ~/.vim
ln -snv "$@" $VIFI_BASE/gitconfig ~/.gitconfig
ln -snv "$@" $VIFI_BASE/zshrc ~/.zshrc
ln -snv "$@" $VIFI_BASE/tmux.conf ~/.tmux.conf


git clone https://github.com/VundleVim/Vundle.vim.git $VIFI_BASE/vim/bundle/Vundle.vim

echo "[vi-fi] Installing plugins via Vundle.vim"
vim -u $VIFI_BASE/vimrc +PluginInstall +qall
