$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  id
  properties :login, :name, :postal_code, :email, :secondary_email
  summarizes :id, :login
end

input = {
  'id'              => '138911938',
  'login'           => 'jackiechan2010',
  'name'            => 'jackie chan',
  'postal_code'     => '05492-092',
  'email'           => 'jachan@gmail.com',
  'secondary_email' => 'jackiepeligroso@yahoo.com'
}

@entries = Customer.parse(input)

puts "root:     #{@entries.inspect}"
puts "resource: #{Customer.resources(@entries)}"
