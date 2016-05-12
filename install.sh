git submodule init
git submodule update
echo | vim +PluginInstall +qall 2>/dev/null
# create symlinks
DOTFILES_DIR=$( cd $(dirname "$0"); pwd -P)
ln -snv $DOTFILES_DIR/vimrc ~/.vimrc
ln -snv $DOTFILES_DIR/vimfiles ~/.vim
