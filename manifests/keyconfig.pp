
define ssh::keyconfig(  $private_basedir,
                        $hostname,
                        $key = undef,
                        $user = undef,
                        $port = undef,
                        $forward_agent = false
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
  
  $entries  = ssh_entries($product, $identity, $name, $forward_agent, $port)

  create_resources(ssh::keyconfig_entry, $entries)
}
