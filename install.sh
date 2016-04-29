# create symlinks
DOTFILES_DIR=$( cd $(dirname "$0"); pwd -P)
echo "$DOTFILES_DIR"
ln -snv $DOTFILES_DIR/vimrc ~/.vimrc
ln -snv $DOTFILES_DIR/vimfiles ~/.vim
