require 'date'
require 'active_support/inflector'
require 'active_support/concern'
require 'active_support/core_ext/class/attribute_accessors'
require 'active_support/core_ext/object/try'
require 'active_support/core_ext/array/wrap'
require 'active_support/core_ext/hash/slice'

require 'transcriber/resource/input_path'
require 'transcriber/resource/parser'
require 'transcriber/resource/response'
require 'transcriber/resource/serialization/boolean'
require 'transcriber/resource/serialization/date'
require 'transcriber/resource/serialization/enumerable'
require 'transcriber/resource/serialization/float'
require 'transcriber/resource/serialization/integer'
require 'transcriber/resource/serialization/string'
require 'transcriber/resource/key'
require 'transcriber/resource/parser/property'
require 'transcriber/resource/parser/embeddable'
require 'transcriber/resource/response/property'
require 'transcriber/resource/response/embeddable'
require 'transcriber/resource/response/relation'
require 'transcriber/resource/response/href'
require 'transcriber/resource/key/property'
require 'transcriber/resource/key/association'
require 'transcriber/resource/key/relation'
require 'transcriber/resource/key/embeddable'
require 'transcriber/resource/key/href'
require 'transcriber/resource/builder/keys'
require 'transcriber/resource/builder/relations'
require 'transcriber/resource/builder/embeddables'
require 'transcriber/resource/builder/properties'
require 'transcriber/resource/builder/summarizations'
require 'transcriber/resource/builder'
require 'transcriber/resource'
require 'transcriber/configuration'

module Transcriber
  def self.configuration
    @configuration ||= Transcriber::Configuration.new
  end

  def self.configure
    yield configuration if block_given?
  end

  def self.host
    configuration.host
  end
end
