VIFI_DIR=$( cd $(dirname "$0"); pwd -P)
echo "[vi-fi] Initializing submodule Vundle"
git submodule init
git submodule update
echo "[vi-fi] Performs Vundle's PluginInstall"
echo | vim +PluginInstall +qall 2>/dev/null
# create symlinks
echo "[vi-fi] Trying to create symlinks"
ln -snv $VIFI_DIR/vimrc ~/.vimrc
ln -snv $VIFI_DIR/vimfiles ~/.vim
