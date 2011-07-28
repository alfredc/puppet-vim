define vim::vimrc($user = $name, $repo, $update = true) {

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
    require => Class['git'],
    notify => Exec["${user} vimrc update"],
  }

  # update repo on every puppet run if desired
  if $update {
    exec { "${user} vimrc update":
      command => "cd /home/${user}/.vim && git pull && git submodule init && git submodule update",
      require => Exec["${user} vimrc"],
    }
  }

}
