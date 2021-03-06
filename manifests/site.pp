require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $luser,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::luser}"
  ]
}

File {
  group => 'staff',
  owner => $luser
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => Class['git']
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include git
  include hub
  include nvm

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar',
      'bash-completion'
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

  # Extra packages from the Puppetfile.
  include p2osx
  include adium
  include skype
  include dropbox
  include chrome
  include p2fonts
  include iwork
  include msoffice
  include alfred
  include lastpass
  include caffeine
  include rdio
  include airfoil
  include moom

  if $developer == 'true' {
    # node versions
    include nodejs::0-4
    include nodejs::0-6
    include nodejs::0-8

    # default ruby versions
    include ruby::1_8_7
    include ruby::1_9_2
    include ruby::1_9_3
    include ruby::2_0_0

    include iterm2::stable
    include tmux
    include sublime_text_2
    include phpstorm
    include xquartz
    include graphviz
    include istatmenus3
    include virtualbox
    include vagrant
    include pkgconfig
    include swig
    include pcre
    include macvim

    class { 'intellij':
      edition => 'community',
    }
  }
  
  if $analyst == 'true' {
    include omnigraffle::pro
  }
  
}
