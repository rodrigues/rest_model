$:.push 'examples'; require 'helper'

class Root < RestModel
  embeds_many :items, fields: [:item1, :item2, :item3, :item4]
end

@root = Root.new(items: %w(i1 i2 i3))
inspect_rest_model(@root)
