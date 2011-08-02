require 'date'
require 'active_support/inflector'
require 'active_support/core_ext/class/attribute_accessors'
require 'active_support/core_ext/object/try'
require 'active_support/core_ext/array/wrap'
require 'active_support/core_ext/hash/slice'

module Transcriber
  autoload :Resource, 'transcriber/resource'
end
