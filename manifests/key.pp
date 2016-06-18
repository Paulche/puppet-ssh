
define ssh::key(  $private_basedir,
                  $public_basedir,
                  $private_sourcedir,
                  $public_sourcedir,
                ) {
  
  # Manage public key
  file { "${public_basedir}/${name}.pub":
    ensure => present, 
    source => "puppet:///$public_sourcedir/${name}.pub",
  }


  # http://apple.stackexchange.com/questions/18458/password-dialog-appears-when-ssh-private-key-permissions-are-set-to-0600
  file { "${private_basedir}/${name}.pub":
    ensure => link,
    target => "${public_basedir}/${name}.pub",
  }
  
  # Manage private key
  file { "${private_basedir}/${name}":
    ensure => present, 
    mode   => '0600',
    source => "puppet:///$private_sourcedir/${name}",
  }

}
