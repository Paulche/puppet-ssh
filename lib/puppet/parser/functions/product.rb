module Puppet::Parser::Functions
  newfunction(:product, :type => :rvalue) do |args|
    raise Puppet::Error, "Must provide exactly two arguments" unless args.count == 2
    raise Puppet::Error, "Must provide exactly two array" unless args.all? { |el| el.kind_of?(Array) }
  
    if args[1].empty?
      args[0].map {|el| [el] }
    else
      args[0].product(args[1])
    end
  end
end
