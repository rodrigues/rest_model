$:.push 'examples'; require 'helper'

class Root < RestModel
  property :id
  embeds_one :item, if: proc {id == "1"}
end

class Item < RestModel
  property :id
end

@root_with_item = Root.parse({id: 1, item: {id: 2000}}).first
inspect_rest_model(@root_with_item)

@root_without_item = Root.parse({id: 100, item: {id: 2000}}).first
inspect_rest_model(@root_without_item)
