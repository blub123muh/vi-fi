git clone https://github.com/VundleVim/Vundle.vim.git vimfiles/bundle/
vim +PluginInstall +qall
# create symlinks
DOTFILES_DIR=$( cd $(dirname "$0"); pwd -P)
ln -snv $DOTFILES_DIR/vimrc ~/.vimrc
ln -snv $DOTFILES_DIR/vimfiles ~/.vim
