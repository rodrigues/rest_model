$:.push 'examples'; require 'helper'

class Entry < RestModel
  property :id
end

class Root < RestModel
  embeds_one :item, class_name: :entry
end

@root = Root.parse({item: {id: 2000}}).first
inspect_rest_model(@root)
