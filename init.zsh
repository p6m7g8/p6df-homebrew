p6df::modules::homebrew::version() { echo "0.0.1" }

# Warning: Using vim because no editor was set in the environment.
# This may change in the future, so we recommend setting EDITOR,
# or HOMEBREW_EDITOR to your preferred text editor.
p6df::modules::homebrew::init() {

  export HOMEBREW_EDITOR=vim

  alias p6_hbr=p6df::modules::homebrew::remove
  alias p6_hbcr=p6df::modules::homebrew::casks::remove
  alias p6_hbbr=p6df::modules::homebrew::brew::remove
}

p6df::modules::homebrew::remove() {

  p6df::modules::homebrew::casks::remove
  p6df::modules::homebrew::brews::remove
}

p6df::modules::homebrew::casks::remove() {

  local formuli=$(brew cask list)

  local formula
  for formula in $(echo $formuli); do
    brew cask uninstall $formula
  done
}

p6df::modules::homebrew::brews::remove() {

  local formuli=$(brew list)

  local formula
  for formula in $(echo $formuli); do
    brew uninstall --ignore-dependencies $formula
  done
}
