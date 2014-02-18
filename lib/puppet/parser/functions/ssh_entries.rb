module Puppet::Parser::Functions 
  newfunction(:ssh_entries, :type => :rvalue) do |args|
    raise Puppet::Error, "Must provide exactly three arguments"                                               unless args.count == 3
    raise Puppet::Error, "Must provide array of entries, followed by the identity_path, followed by sshname"  unless args[0].kind_of?(Array) and args[1].kind_of?(String) and args[1].kind_of?(String)

    args[0].reduce({}) do |acc,el|  
      acc[%Q{#{args[2]}!#{el[1]}@#{el[0]}}] = { 'hostname' => el[0], 'identity' => args[1], 'sshname' => args[2] }
      acc[%Q{#{args[2]}!#{el[1]}@#{el[0]}}]['user'] = el[1] if el[1]
      acc
    end
  end
end

