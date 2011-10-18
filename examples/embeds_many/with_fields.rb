$:.push 'examples'; require 'helper'

class Root < RestModel
  embeds_many :items, fields: [:item1, :item2, :item3]
end

@root = Root.from_source!(item1: "i1", item2: "i2", item3: "i3").first

inspect_rest_model(@root)
