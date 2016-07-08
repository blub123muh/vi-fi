vi-fi
=====

Description
-----------

My rapidly evolving vi\[m\]-fi\[les\]. In the following, I give a brief overview of the included plugins and their usage.

### tpope/vim-fugitive

Very handy git integration, try it with
`:Gstatus` as main entry point, then jam `cc` to commit and `ZZ` to exit commit prompt, and occasionally do a `:Gpush`

### tpope/vim-surround

Allows to surround words with braces or quotation marks. `ysiw"` : add quotation marks around word under cursor `cs{(` : change from curly to normal braces and much more..

### tpope/vim-repeat

Makes repeating with '.' behave as expected for other plugins. "Oh i need to surround another word with quotation marks, okay.. just press `.`"

### tpope/vim-vinegar

Beautiful improvements of standard file browser netrw, basically makes NERDTree obsolete, In case, you like NERDTree's side bar, try `:23Lex`.

### vim-unimpaired

Adds some handy shortcuts for :{ABC}previous and :{ABC}next and more \* Switch arguments, buffers, quickfix entries with `]a`, `]b`, `]c` and their pairs. As I do use german keyboard layout, ö,ä are mapped to \[, \] for convenience.
Also supplies some standard option toggling shortcuts `cos` for toggle spell and much more.

### scrooloose/syntastic

Its just adds the missing syntax checking without compiling, just `:w` your file and the syntax errors and warnings appear. Bonus: for python it also warns you, whenever you violate a coding guideline (PEP) or checks your latex style.

### tpope/comments

Great plugin to just slam ,cc to toggle the comment status of a line, block, whatever. Note that there are much more commenting related commands (most often mapped as ,c&lt;something&gt;).

### csv-vim

Beautiful display of csv files. But indenting may become really expensive in large files. Therefore, i do not let it auto-arrange columns on opening a csv file. \* :%ArrangeColumn arranges whole file (üac) \* :%UnarrangeColumn compresses it for writing (üuc) There are also options for inserting or deleting records and columns such as: \* :NewRecord which i mapped to (ünr)

### wannesm/wmgraphviz.vim

Interactive viewer for graphviz's dot language. ,li in a .dot file -&gt; It's super effective!

### sjl/badwolf

I highly recommend Steve Losh's book about learning vimscript the hard way. + His color scheme is actually very satisfying.

Contributions
-------------

-   Nomadic vimrc mode (invokable with -u), even including plugins, and correct vimrc access mappings.
-   plugins/grep-operator.vim (based on steve losh's book)
-   plugins/qutebrowser.vim (similar to the grep operator but invokes my qute browser)
-   German Keyboard layout mappings (makes use of öäü)

Installation
------------

1.  Clone the repository git clone http://www.github.com/blub123muh/vi-fi.git
2.  Try it (even without symlinking or copying anything). 'vim -u vi-fi/vimrc'
3.  Enjoy...
4.  And optionally install symlinks. bash vi-fi/install.sh

Maintainer
----------

Lukas Galke vim@lpag.de
