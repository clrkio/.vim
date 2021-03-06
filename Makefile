.PHONY: default
default: garf

.PHONY: install
install: | symlink-configs update-plugins helptags garf

.PHONY: update
update: | update-plugins helptags garf


.PHONY: symlink-configs
symlink-configs:
	@echo "+ $@"
	ln -snf "$(HOME)/.vim/vimrc" "$(HOME)/.vimrc"

.PHONY: update-plugins
update-plugins:
	@echo "+ $@"
	git submodule update --init --recursive
	git submodule foreach git pull --recurse-submodules origin master

.PHONY: helptags
helptags:
	@echo "+ $@"
	@vim -c "Helptags | q"

.PHONY: update-pathogen
update-pathogen:
	@echo "+ $@"
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# garf satan
.PHONY: garf
garf:
	@echo "+ $@"
	@echo ""
	@echo "\033[0;35m"
	@cat .garf
	@echo "\033[0m"
	@echo ""
