
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
  
  # Manage private key
  file { "${private_basedir}/${name}":
    ensure => present, 
    source => "puppet:///$private_sourcedir/${name}",
  }

}
