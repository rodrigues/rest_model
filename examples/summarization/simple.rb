$:.push 'lib'; require 'transcriber'

module AsDefined
  def self.call(keys)
    keys
  end
end

class Customer < Transcriber::Resource
  convert_input_keys AsDefined
  id
  properties :login, :name, :postal_code, :email, :secondary_email
  summarizes :id, :login
end

input = {
  id:               138911938,
  login:           'jackiechan2010',
  name:            'jackie chan',
  postal_code:     '05492-092',
  email:           'jachan@gmail.com',
  secondary_email: 'jackiepeligroso@yahoo.com'
}

@root = Customer.transcribe(input)

puts "resources: #{@root.inspect}"
