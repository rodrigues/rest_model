$:.push 'examples'; require 'helper'

class Entry < RestModel
  property :id, type: Integer
end

class Root < RestModel
  embeds_many :items, class_name: :entry
end

@root = Root.from_source(items: [{id: 2000}]).first

inspect_rest_model(@root)
