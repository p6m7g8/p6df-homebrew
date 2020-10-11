######################################################################
#<
#
# Function: p6df::modules::homebrew::version()
#
#>
######################################################################
p6df::modules::homebrew::version() { echo "0.0.1" }


######################################################################
#<
#
# Function: p6df::modules::homebrew::deps()
#
#>
######################################################################
p6df::modules::homebrew::deps() {
  ModuleDeps=(
    p6m7g8/p6common
  )
}

# Warning: Using vim because no editor was set in the environment.
# This may change in the future, so we recommend setting EDITOR,
# or HOMEBREW_EDITOR to your preferred text editor.
######################################################################
#<
#
# Function: p6df::modules::homebrew::init()
#
#>
######################################################################
p6df::modules::homebrew::init() {

  export HOMEBREW_EDITOR=vim

  alias p6_hbr=p6df::modules::homebrew::remove
  alias p6_hbcr=p6df::modules::homebrew::casks::remove
  alias p6_hbbr=p6df::modules::homebrew::brew::remove
}

######################################################################
#<
#
# Function: p6df::modules::homebrew::remove()
#
#>
######################################################################
p6df::modules::homebrew::remove() {

  p6df::modules::homebrew::casks::remove
  p6df::modules::homebrew::brews::remove
}

######################################################################
#<
#
# Function: p6df::modules::homebrew::casks::remove()
#
#>
######################################################################
p6df::modules::homebrew::casks::remove() {

  local formuli=$(brew cask list)

  local formula
  for formula in $(echo $formuli); do
    brew cask uninstall $formula
  done
}

######################################################################
#<
#
# Function: p6df::modules::homebrew::brews::remove()
#
#>
######################################################################
p6df::modules::homebrew::brews::remove() {

  local formuli=$(brew list)

  local formula
  for formula in $(echo $formuli); do
    brew uninstall --ignore-dependencies $formula
  done
}