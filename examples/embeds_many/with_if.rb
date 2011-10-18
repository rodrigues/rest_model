$:.push 'examples'; require 'helper'

class Item < RestModel
  property :id
end

class Root < RestModel
  property :id
  embeds_many :items, if: proc {id == "10"}
end

@root_with_items = Root.from_source!(id: 10, items: [{id: 2000}]).first
inspect_rest_model(@root_with_items)

@root_without_items = Root.from_source!(id: 1, items: [{id: 2000}]).first
inspect_rest_model(@root_without_items)
