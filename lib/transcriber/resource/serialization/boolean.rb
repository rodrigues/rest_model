module Transcriber
  class Resource
    module Serialization
      class Boolean
        MAPPINGS  = {
          true    => true,
          "true"  => true,
          "TRUE"  => true,
          "1"     => true,
          1       => true,
          1.0     => true,
          "x"     => true,
          "X"     => true,
          "t"     => true,
          "T"     => true,
          false   => false,
          "false" => false,
          "FALSE" => false,
          "0"     => false,
          0       => false,
          0.0     => false,
          ""      => false,
          " "     => false,
          "f"     => false,
          "F"     => false,
          nil     => false
        }.freeze

        def self.serialize(value)
          MAPPINGS[value].tap do |bool|
            fail "value not serializable: #{value}" if bool.nil?
          end
        end

        def self.desserialize(value)
          fail unless boolean?(value)

          value ? Transcriber.configuration.true_value
                : Transcriber.configuration.false_value
        end

        private

        def self.boolean?(value)
          !!value == value
        end
      end
    end
  end
end
