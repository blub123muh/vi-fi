VIFI_DIR=$( cd $(dirname "$0"); pwd -P)
if [ -e $VIFI_DIR/vimfiles/bundle/Vundle.vim ]
then
    echo "[vi-fi] Found Vundle"
else
    echo "[vi-fi] Cloning Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git $VIFI_DIR/vimfiles/bundle/Vundle.vim
fi
echo "[vi-fi] Creating symlinks (force with -f)"
ln -snv "$@" $VIFI_DIR/vimrc ~/.vimrc
ln -snv "$@" $VIFI_DIR/vimfiles ~/.vim
echo "[vi-fi] Installing other plugins via Vundle"
echo | vim +PluginInstall! +qall 2>/dev/null
