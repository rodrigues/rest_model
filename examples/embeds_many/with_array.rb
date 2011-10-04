$:.push 'examples'; require 'helper'

class Root < RestModel
  embeds_many :items, class_name: :array
end

@root = Root.new
@root.items = ["a", "b"]

inspect_rest_model(@root)
