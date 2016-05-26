VIFI_BASE=$( cd $(dirname "$0"); pwd -P)
#if [ -e $VIFI_BASE/vimfiles/bundle/Vundle.vim ]
#then
#    echo "[vi-fi] Found Vundle"
#else
#    echo "[vi-fi] Cloning Vundle"
#    git clone https://github.com/VundleVim/Vundle.vim.git $VIFI_BASE/vimfiles/bundle/Vundle.vim
#fi
#if [ ! -e $VIFI_BASE/vimfiles/autoload/plug.vim ]
#then
#    echo "[vi-fi] Curling vim-plug"
#    curl -fLo $VIFI_BASE/vimfiles/autoload/plug.vim --create-dirs\
#       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#fi

#echo "[vi-fi] Installing plugins with vim-plug"
vim -u $VIFI_BASE/vimrc +PlugUpgrade +PlugInstall +PlugUpdate +qall

echo "[vi-fi] Creating symlinks (force with -f)"
ln -snv "$@" $VIFI_BASE/vimrc ~/.vimrc
ln -snv "$@" $VIFI_BASE/vifi ~/.vim
