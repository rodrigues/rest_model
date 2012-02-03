$:.push 'examples'; require 'helper'

module HeadersResolver
  def self.call(resource_class)
    {class: resource_class.to_s}
  end
end

RestModel::Configuration.configure do |c|
  c.custom_headers_resolver = HeadersResolver
end

class Item < RestModel
  id
  property :login
end

Item.get
