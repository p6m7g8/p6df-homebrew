p6df::modules::homebrew::version() { echo "0.0.1" }
p6df::modules::homebrew::deps()    { 
	ModuleDeps=()
}

p6df::modules::homebrew::external::brew() { 
}

p6df::modules::homebreg::init() {
}


## XXX: broken
remove_casks() {

    local formuli=$(grep ^cask bin/Brewfile | awk '{print $2}' | sed -e "s,',,g")

    local formula
    for formula in $formuli; do
        brew cask uninstall $formula
    done
}

remove_brews() {

    local formuli=$(grep ^brew bin/Brewfile | awk '{print $2}' | sed -e "s,',,g" -e 's/,.*//')

    local formula
    for formula in $formuli; do
        brew uninstall --ignore-dependencies $formula
    done
}
