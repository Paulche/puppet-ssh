
define ssh::keyconfig_entry(
  $hostname,
  $user = undef,
  $port = undef,
  $identity,
  $sshname,
  $forward_agent
) {

  # Manage fragment of user-config file
  concat::fragment { $name: 
    target  => $ssh::user_config_file,
    content => template("ssh/user_config_fragment.erb")
  }

}
