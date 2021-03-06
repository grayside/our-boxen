# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "1.2.0"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",  "1.0.0"
github "gcc",      "1.0.0"
github "git",      "1.0.0"
github "homebrew", "1.1.2"
github "hub",      "1.0.0"
github "inifile",  "0.9.0", :repo => "cprice-puppet/puppetlabs-inifile"
github "nginx",    "1.1.0"
github "nodejs",   "1.0.0"
github "nvm",      "1.0.0"
github "ruby",     "3.1.0"
github "stdlib",   "3.0.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",     "1.0.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
github "adium",    "1.0.1"
github "iterm2",   "1.0.2"
github "skype",    "1.0.2"
github "dropbox",  "1.1.0"
github "tmux",     "1.0.1"
github "intellij", "1.1.2"
github "chrome",   "1.1.0"
github "sublime_text_2",   "1.1.0"
github "alfred",      "1.0.1"
github "xquartz",     "1.0.0"
github "rdio",        "1.0.0"
github "istatmenus3", "1.0.0"
github "graphviz",    "1.0.0"
github "caffeine",    "1.0.0"
github "colloquy",    "1.0.0"
github "airfoil",     "0.0.1"
github "virtualbox",  "1.0.1"
github "vagrant",     "2.0.2"
github "pkgconfig",   "1.0.0"
github "swig",        "1.0.0"
github "pcre",        "1.0.0"
github "macvim",      "1.0.0"
github "moom",        "1.0.1", :repo => "phase2/puppet-moom"
github "phpstorm",    "1.0.2", :repo => "phase2/puppet-phpstorm"
github "lastpass",    "1.0.0", :repo => "dieterdemeyer/puppet-lastpass"
github "limechat",    "1.0.0", :repo => "dieterdemeyer/puppet-limechat"

# Some local, private modules
mod    "iwork",       :git => "git@bitbucket.org:phase2tech/puppet-iwork.git", :ref => "1.0.2"
mod    "msoffice",    :git => "git@bitbucket.org:phase2tech/puppet-msoffice.git", :ref => "1.0.1"
mod    "omnigraffle", :git => "git@bitbucket.org:phase2tech/puppet-omnigraffle.git", :ref => "1.0.2"
mod    "p2fonts",     :git => "git@bitbucket.org:phase2tech/puppet-p2fonts.git", :ref => "1.0.1"
mod    "p2osx",       :git => "git@bitbucket.org:phase2tech/puppet-p2osx.git", :ref => "master"


