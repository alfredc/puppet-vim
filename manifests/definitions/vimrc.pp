define vim::vimrc($user = $name, $repo) {

  file { "/home/${user}/.vimrc":
    content => 'source ~/.vim/vimrc',
    owner => $user,
    group => $user,
    mode => 644,
  }

  # download repo
  exec { "${user} vimrc":
    command => "git clone $repo /home/${user}/.vim",
    creates => "/home/${user}/.vim",
    require => [ Package['ssh'], Package['git'] ],
  }

}
