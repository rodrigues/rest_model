$:.push 'examples'; require 'helper'

class Root < RestModel
  embeds_one :item, start_key: ""
end

class Item < RestModel
  property :id
end

@root = Root.from_source(id: 2000).first
inspect_rest_model(@root)
