require 'spec_helper'

describe Transcriber::Resource::Properties do
  class Example < Transcriber::Resource
  end

  before { Example.keys.clear }

  describe ".property" do
    it "creates a property" do
      class Example
        property :login
      end

      Example.keys.first.name.should == :login
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

      Example.keys.first.serializer.should == Transcriber::Resource::Serialization::String
    end

    it "configures a default field" do
      class Example
        property :login
      end

      Example.keys.first.field_path.should == "LOGIN"
    end

    it "sets property type if defined" do
      class Example
        property :login, type: Transcriber::Resource::Serialization::Date
      end

      Example.keys.first.serializer.should == Transcriber::Resource::Serialization::Date
    end

    it "sets property values if defined" do
      class Example
        property :login, values: {a: '1', b: '2'}
      end

      Example.keys.first.values.should == {a: '1', b: '2'}
    end

    it "sets extra options if defined" do
      class Example
        property :login, restricted: 'admin'
      end

      Example.keys.first.options[:restricted].should == 'admin'
    end
  end
end