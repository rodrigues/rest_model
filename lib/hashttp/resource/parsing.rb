class Hashttp::Resource
  module Parsing
    autoload :Property,     'lib/model/parsing/property'
    autoload :Relation,     'lib/model/parsing/relation'

    include Property
    include Relation

    def parse(result, start_key = nil)
      entries(result, start_key).collect do |item|
        params = parse_properties({}, item)
        params = parse_relations(params, item)
        self.new(params)
      end
    end

    private

    def entries(entries, start_key)
      entries = entries[start_key.to_s.upcase] if start_key
      entries = [entries] if entries.kind_of?(Hash)
      entries
    end
  end
end
