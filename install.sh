DOTFILES_DIR=$( cd $(dirname "$0"); pwd -P)
ln -svfn $DOTFILES_DIR/.vimrc ~/.vimrc
ln -svfn $DOTFILES_DIR/.vim ~/.vim
