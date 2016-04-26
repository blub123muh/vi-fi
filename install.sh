# create symlinks
DOTFILES_DIR=$( cd $(dirname "$0"); pwd -P)
ln -snv "$DOTFILES_DIR/.vimrc ~/.vimrc"
ln -snv "$DOTFILES_DIR/.vim ~/.vim"
