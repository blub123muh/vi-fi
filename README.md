# vi-fi
## Description
My rapidly evolving vi[m]-fi[les].  In the following, I give a brief overview
of the included plugins and their usage.  Consider ',' as my mapleader and 'ü'
as my maplocalleader, when I give mappings.

### tpope/vim-fugitive
Very handy git integration, try it with:
* :Gwrite to git add current file
* :Gcommit, :Gpush, :Gpull
* :Gstatus to visually select files to add/reset
* :Glog to go through the commit history by ]b, [b.

### tpope/vim-surround
Allows to surround words with braces or quotation marks.
* ysiw" : add quotation marks around word under curser
* cs{(  : change from curly to normal braces

### tpope/vim-repeat
Makes repeating with '.' behave as expected for other plugins.  "Oh i need to
surround another word with quotation marks, okay.. just press '.'

### tpope/vim-vinegar
Beautiful improvements of standard file browser netrw,
basically makes NERDTree obsolete,
In case,  you like NERDTree's side bar, try :20Lex.

### vim-unimpaired
Adds some handy shortcuts for :{ABC}previous and :{ABC}next and more
* Switch arguments, buffers, quickfix entries with
]a, ]b, ]c and their pairs.
* As I do use german keyboard layout, ö,ä are mapped to [, ] for convenience.

### scrooloose/syntastic
Its just adds the missing syntax checking without compiling,
just :w[rite] your file
and the syntax errors and warnings appear.
Bonus: (at least) for python it also warns you, whenever you violate a coding
guideline (PEP)

### scrooloose/nerdcommenter
Great plugin to just slam ,cc to toggle the comment status of a line, block,
whatever.  Note that there are much more commenting related commands (most
often mapped as
,c\<something\>).

### vim-airline/vim-airline
While trying to setup an own statusbar,
this one comes with all the stuff I want,
but still aims to stay lightweight.

### vim-airline/vim-airline-themes
And there are beautiful colors, which are set according to your current
colorscheme.

### vim-gitgutter
Displays small indicator signs on the left,
whenever editing a file under git version control.
I like it.

### vim-latex
A lots of stuff to discover here, but most notably:
* ,ll compile with a nice rule (including bibtex, cross-reference resolving)
* ,lv view in your favorite pdf viewer
* EIT in insert mode -> "Enter Itemize" Sets up a nice itemize environment for
  you.

### csv-vim
Beautiful display of csv files. But indenting may become really expensive in
large files. Therefore, i do not let it auto-arrange columns on opening a csv
file.
* :%ArrangeColumn arranges whole file (üac)
* :%UnarrangeColumn compresses it for writing (üuc)
There are also options for inserting or deleting records and columns such as:
* :NewRecord which i mapped to (ünr)

### wannesm/wmgraphviz.vim
Interactive viewer for graphviz's dot language.
,li in a .dot file -> It's super effective!

### sjl/badwolf
I highly recommend Steve Losh's book about learning vimscript the hard way. +
His color scheme is actually very satisfying.

### suan/vim-instant-markdown
The inclusion of this plugin is considered expiremental,
since it requires the command 'instant-markdown-d' to be installed (npm
package).
But it's exactly what youre looking for, when you're writing a .md file and
care for the actual output...
Let me check this file right now, with 'üli'.


## Contributions
* Nomadic vimrc mode (invokable with -u), even including plugins, and correct
  vimrc access mappings.
* plugins/grep-operator.vim (based on steve losh's book)
* plugins/qutebrowser.vim (similar to the grep operator but invokes my qute
  browser)
* German Keyboard layout mappings (makes use of öäü)

## Installation
1. Clone the repository
    git clone http://www.github.com/blub123muh/vi-fi.git
2. Try it (even without symlinking or copying anything).
    'vim -u vi-fi/vimrc'
3. Enjoy...
4. And optionally install symlinks.
    bash vi-fi/install.sh

## Maintainer
Lukas Galke\
<vi-fi@lpag.de>\
<http://lpag.de>

