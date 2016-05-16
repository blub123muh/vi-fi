VIFI_DIR=$( cd $(dirname "$0"); pwd -P)
cd $VIFI_DIR
echo "[vi-fi] Cloning Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git $VIFI_DIR/vimfiles/bundle/Vundle.vim
echo "[vi-fi] Creating symlinks"
ln -snv "$@" $VIFI_DIR/vimrc ~/.vimrc
ln -snv "$@" $VIFI_DIR/vimfiles ~/.vim
echo "[vi-fi] Installing other plugins via Vundle"
echo | vim +PluginInstall! +qall 2>/dev/null
