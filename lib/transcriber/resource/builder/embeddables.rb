module Transcriber
  class Resource
    module Builder
      module Embeddables
        def embeds(name, options = {})
          key Embeddable.new(name, options)
        end

        def embeds_one(name, options = {})
          options.merge!(many: false)
          embeds(name, options)
        end

        def embeds_many(name, options = {})
          options.merge!(many: true)
          embeds(name, options)
        end
      end
    end
  end
end
