module Examples
  module EmbedsOne
    module Simple
      INPUT   = {"ID" => 2000}

      class Root < Transcriber::Resource
        embeds_one :item
      end

      class Item < Transcriber::Resource
        property :id
      end
    end

    module WithClassName
      INPUT   = {"ID" => 2000}

      class Root < Transcriber::Resource
        embeds_one :item, class_name: 'embeds_one_example/with_class_name/entry'
      end

      class Entry < Transcriber::Resource
        property :id
      end
    end

    module WithStartKey
      INPUT   = {"UGLY_NESTING_KEY" => {"ID" => 2000}}

      class Root < Transcriber::Resource
        embeds_one :item, start_key: :ugly_nesting_key
      end

      class Item < Transcriber::Resource
        property :id
      end
    end
  end
end
