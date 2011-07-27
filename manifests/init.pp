# Class: vim
#
# For installing vim
#
class vim {

  # Vim-nox is compiled with Perl, Python, Ruby, and Tcl support (but no GUI)
  package { "vim-nox":
    ensure  => installed,
  }

}