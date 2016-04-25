DOTFILES_DIR=$( cd $(dirname "$0"); pwd -P)
echo "Absolute path: $DOTFILES_DIR"
ln -svf $DOTFILES_DIR/.vimrc ~/.vimrc
ln -svf $DOTFILES_DIR/.vim ~/.vim
