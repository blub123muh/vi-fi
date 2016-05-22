VIFI_DIR=$( cd $(dirname "$0"); pwd -P)
#if [ -e $VIFI_DIR/vimfiles/bundle/Vundle.vim ]
#then
#    echo "[vi-fi] Found Vundle"
#else
#    echo "[vi-fi] Cloning Vundle"
#    git clone https://github.com/VundleVim/Vundle.vim.git $VIFI_DIR/vimfiles/bundle/Vundle.vim
#fi
#if [ ! -e $VIFI_DIR/vimfiles/autoload/plug.vim ]
#then
#    echo "[vi-fi] Curling vim-plug"
#    curl -fLo $VIFI_DIR/vimfiles/autoload/plug.vim --create-dirs\
#       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#fi

#echo "[vi-fi] Installing plugins with vim-plug"
vim -u $VIFI_DIR/vimrc +PlugUpgrade +PlugInstall +PlugUpdate +qall

echo "[vi-fi] Creating symlinks (force with -f)"
ln -snv "$@" $VIFI_DIR/vimrc ~/.vimrc
ln -snv "$@" $VIFI_DIR/vimfiles ~/.vim
