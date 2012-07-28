automatic-ctags.vim
===================

Don't use this plugin yet, work in progress

I wrote this plugin to generate ctags files for
all my projects. I use ctags in combination with
[FuzzyFinder.vim](https://github.com/vim-scripts/FuzzyFinder) to move
around, a fast way to "take me to this method".

        <C-i> :FufTag <CR>

This plugin generates and updates ctags and keep them in the project
root directories. It locates the `project root` directory searching for
specific files that indicates a code project. By default its `.git` and
`Gemfile`.

* `:AutomaticCtags` will regenerate the tagsfile

Map this to a key, trigger it on every save or just run it when you need
to generate tags. Since the plugin traverses the every dir down to you
home directory, its a good idea only running the command when you know
it will hit one of your filenames that indicates a project.

        autocmd BufWritePost *.rb :call AutomaticCtags()
        map <F1> AutomaticCtags

Installation
------------

If you don't have a preferred installation method, I recommend
installing [pathogen.vim](https://github.com/tpope/vim-pathogen) with
[vim-update-bundles](https://github.com/bronson/vim-update-bundles/)

Add place all your plugins to your `.vimrc` using

        " Bundle: tilljoel/vim-automatic-ctags       # https://github.com/tilljoel/vim-automatic-ctags

Configuration
-------------
Add these lines to your `.vimrc` and change them for your needs. The
default values are the ones below so if they are good you can skip these
lines.

        let g:automatic_ctags_files=".git,Gemfile"
        let g:automatic_ctags_cmd="ctags"
        let g:atomatic_ctags_filename="tags"

Contributing
------------
Fork it, fix it. Its my first vim plugin ever.

Follow
------

Just hit follow [here on
GitHub](https://github.com/tilljoel/vim-automatic-ctags) or find me on:

* [Twitter](http://twitter.com/tilljoel)
* [GitHub](https://github.com/tilljoel)
