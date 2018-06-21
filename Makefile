# set up ~/.vimrc for the current user. assumes that the repo is cloned
# into ~/.vim.
.PHONY: install
install:
	@echo "+ $@"
	ln -snf "$(HOME)/.vim/vimrc" "$(HOME)/.vimrc"

.PHONY: update
update: | update-plugins garf

.PHONY: update-plugins
update-plugins:
	@echo "+ $@"
	git submodule update --init --recursive
	git submodule foreach git pull --recurse-submodules origin master
	vim -c "Helptags | q"

.PHONY: update-pathogen
update-pathogen:
	@echo "+ $@"
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# garf satan
.PHONY: garf
garf:
	@echo ""
	@echo "\033[0;35m"
	@cat .garf
	@echo "\033[0m"
	@echo ""
