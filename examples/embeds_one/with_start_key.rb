$:.push 'examples'; require 'helper'

class Root < RestModel
  embeds_one :item, start_key: 'ugly_nesting_key'
end

class Item < RestModel
  property :id
end

@root = Root.parse({'ugly_nesting_key' => {id: 2000}}).first
inspect_rest_model(@root)
