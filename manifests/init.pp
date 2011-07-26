# Class: vim
#
# For installing vim
#
class vim {

  package { "vim":
    ensure  => installed,
  }

}