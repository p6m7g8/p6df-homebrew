p6df::modules::homebrew::version() { echo "0.0.1" }
p6df::modules::homebrew::deps()    {
	ModuleDeps=()
}

p6df::modules::homebrew::init() {
}

# XXX: API
remove_casks() {

    local formuli=$(brew cask list)

    local formula
    for formula in $(echo $formuli); do
	brew cask uninstall $formula
    done
}

remove_brews() {

    local formuli=$(brew list)

    local formula
    for formula in $(echo $formuli); do
	brew uninstall --ignore-dependencies $formula
    done
}
