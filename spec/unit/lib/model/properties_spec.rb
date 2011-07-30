require 'spec_helper'

describe Hashttp::Resource::Properties do
  class Example
    extend Hashttp::Resource::Properties
  end

  before { Example.properties.clear }

  describe ".property" do
    it "creates a property" do
      class Example
        property :login
      end

      Example.properties.first.name.should == :login
    end

    it "defines an attr_accessor with property name" do
      class Example
        property :id
      end

      Example.new.tap do |example|
        example.id = 2020
        example.id.should == 2020
      end
    end

    it "configures a default serializer" do
      class Example
        property :login
      end

      Example.properties.first.serializer.should == Hashttp::Resource::Serialization::String
    end

    it "configures a default field" do
      class Example
        property :login
      end

      Example.properties.first.field.should == "LOGIN"
    end

    it "sets property type if defined" do
      class Example
        property :login, type: Hashttp::Resource::Serialization::Date
      end

      Example.properties.first.serializer.should == Hashttp::Resource::Serialization::Date
    end

    it "sets property values if defined" do
      class Example
        property :login, values: {a: '1', b: '2'}
      end

      Example.properties.first.values.should == {a: '1', b: '2'}
    end

    it "sets extra options if defined" do
      class Example
        property :login, restricted: 'admin'
      end

      Example.properties.first.options[:restricted].should == 'admin'
    end
  end
end