$:.push 'examples'; require 'helper'

class Item < RestModel
  property :id
end

class Root < RestModel
  embeds_many :items
end

@root = Root.new
inspect_rest_model(@root)
