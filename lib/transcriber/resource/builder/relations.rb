module Transcriber
  class Resource
    module Builder
      module Relations
        def relation(name, options)
          key Relation.new(name, options)
        end

        def has_one(name, options = {})
          options.merge!(many: false, has: true)
          relation(name, options)
        end

        def has_many(name, options = {})
          options.merge!(many: true, has: true)
          relation(name, options)
        end

        def belongs_to(name, options = {})
          options.merge!(many: false, has: false)
          relation(name, options)
        end
      end
    end
  end
end
