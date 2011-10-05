$:.push 'examples'; require 'helper'

class Root < RestModel
  embeds_one :item
end

class Item < RestModel
  properties :id, :name
end

@root = Root.from_source(item: {id: 2000}).first
@root.update_attributes(item: {name: "name"})

inspect_rest_model(@root)
