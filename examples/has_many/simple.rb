$:.push 'lib'; require 'transcriber'

class Service < Transcriber::Resource
  property :name
  belongs_to :customer
end

class Billing < Transcriber::Resource
  property :login
  belongs_to :customer
end

class Developer < Transcriber::Resource
  property :login
  belongs_to :customer
end

class Customer < Transcriber::Resource
  id field: :customer_id, type: Integer
  property :login
  has_many :services
  has_one :billing
  has_one :devops, class_name: :developer
end

@root = Customer.parse({customer_id: 123, login: 'jackiechan2010'}).first

puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"
