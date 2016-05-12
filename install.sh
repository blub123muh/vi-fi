VIFI_DIR=$( cd $(dirname "$0"); pwd -P)
cd $VIFI_DIR
echo "[vi-fi] Initializing submodule Vundle"
git submodule init
git submodule update
echo "[vi-fi] Installing other Plugins"
echo | vim +PluginInstall +qall 2>/dev/null
# create symlinks
echo "[vi-fi] Creating symlinks"
ln -snv "$@" $VIFI_DIR/vimrc ~/.vimrc
ln -snv "$@" $VIFI_DIR/vimfiles ~/.vim
