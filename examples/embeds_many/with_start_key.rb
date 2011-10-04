$:.push 'examples'; require 'helper'

class Item < RestModel
  property :id, field: :item_id
end

class Root < RestModel
  embeds_many :items, start_key: 'detalhe.itens'
end

@root = Root.parse({"detalhe" => {"itens" => [{item_id: 2000}]}}).first

inspect_rest_model(@root)
