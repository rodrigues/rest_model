$:.push 'lib'; require 'transcriber'

class Service < Transcriber::Resource
  property :login
end

class Billing < Transcriber::Resource
  property :login
end

class Developer < Transcriber::Resource
  property :login
end

class Customer < Transcriber::Resource
  id field: :customer_id
  property :login
  has_many :services
  has_one :billing
  has_one :devopada, class_name: :developer
end

root = Customer.parse({"customer_id" => 123, "login" => 2000}).first

puts "root:     #{root.inspect}"
puts "resource: #{root.resource}"
