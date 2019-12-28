Shamelessly copied from [Ben](https://github.com/blinsay/.vim)

Vimrc and pathogen bundles, installed as submodules. Tim Pope might not like to
[get crazy](https://github.com/tpope/vim-pathogen#runtime-path-manipulation),
but I do.

#### adding a new plugin

adding a new plugin involves:

- adding it as a git submodule with `git submodule add <url> bundle/<plugin-name>`
- editing .gitmodules to keep it organized
- running `make helptags`

#### updating plugins

run `make update` and stare into garf's eyes.

#### removing plugins

somehow this is a three step process:

- `git submodule deinit -f -- bundle/<plugin-name>`
- `rm -rf .git/modules/bundle/<plugin-name>`
- `git rm -f bundle/<plugin-name>`

