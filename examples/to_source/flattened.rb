$:.push 'examples'; require 'helper'

class Root < RestModel
  embeds_one :item, start_key: ""
end

class Item < RestModel
  property :id
end

@root = Root.new(item: {id: 2000})
inspect_rest_model(@root)
