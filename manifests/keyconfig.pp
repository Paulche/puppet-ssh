
define ssh::keyconfig(  $private_basedir,
                        $hostname,
                        $key = undef,
                        $user = undef,
                      ) {
  
  $anyhost  = any2array($hostname)
  
  if($user) 
  {
    if(is_array($user))
    {
      $anyuser = $user
    }
    else
    {
      $anyuser = [$user]
    }
  }
  else
  {
    $anyuser = []
  }

  $product  = product($anyhost, $anyuser)
  
  if($key) 
  {
    $identity = "${private_basedir}/${key}"
  }
  else
  {
    ensure_resource('ssh::key', $name)
    $identity = "${private_basedir}/${name}"
  }
  
  $entries  = ssh_entries($product, $identity, $name)

  create_resources(ssh::keyconfig_entry, $entries)
}
