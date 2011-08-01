require 'spec_helper'

describe Transcriber::Resource::Properties do
  describe ".property" do
    before do
      class Example < Transcriber::Resource
        property :document_number, some_option: 'this is an option'
      end
    end

    it "defines an attr_accessor with property name" do
      Example.new.tap do |example|
        example.respond_to?("document_number").should be_true
        example.respond_to?("document_number=").should be_true
      end
    end

    it "puts a new property in keys list" do
      Example.keys.first.name.should == :document_number
      Example.keys.first.options.should == {some_option: 'this is an option'}
    end
  end

  describe ".properties" do
    before do
      class Example < Transcriber::Resource
        properties :id, :description
        properties :price, :quantity, firstoption: 'this is the first option', secondoption: 'this is the second option'
      end
    end

    it "defines an attr_accessor for each given name" do
      Example.new.tap do |example|
        example.respond_to?("id").should be_true
        example.respond_to?("id=").should be_true
        example.respond_to?("description").should be_true
        example.respond_to?("description=").should be_true
      end
    end

    it "supports option definition" do
      Example.keys.find_all{ |item| [:price, :quantity].include?(item.name) }.each do |key|
        key.options[:firstoption].should == 'this is the first option'
        key.options[:secondoption].should == 'this is the second option'
      end
    end
  end
end