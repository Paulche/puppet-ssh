
class ssh {
  include boxen::config

  $user_config_dir    = "/Users/${::boxen_user}/.ssh"
  $user_config_file   = "${user_config_dir}/config"

  file { $user_config_dir:
    ensure  => directory,
    owner   => $boxen_user,
  }

  concat { $user_config_file:

  }

  concat::fragment { 'ssh.header':
    target  => $user_config_file,
    source  => "puppet:///modules/${module_name}/header",
    order   => '01',
  }

}
