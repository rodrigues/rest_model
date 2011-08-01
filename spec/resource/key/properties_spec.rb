require 'spec_helper'

describe Transcriber::Resource::Properties do
  class Receipt < Transcriber::Resource
    property :document_number, some_option: 'abab'
  end
  
  describe ".property" do
    it "defines an attr_accessor with property name" do
      Receipt.new.tap do |r|
        r.document_number = 2020
        r.document_number.should == 2020
      end
    end

    it "puts a new property in keys list" do
      Receipt.keys.first.name.should == :document_number
      Receipt.keys.first.options.should == {some_option: 'abab'}
    end
  end
  
  describe ".properties" do
    class Item < Transcriber::Resource
      properties :id, :description
      properties :price, :quantity, firstoption: 'this is the first option', secondoption: 'this is the second option'
    end
    
    it "defines an attr_accessor for each given name" do
      Item.new.tap do |item|
        item.respond_to?("id").should be_true
        item.respond_to?("id=").should be_true
        item.respond_to?("description").should be_true
        item.respond_to?("description=").should be_true
      end
    end
    
    it "supports option definition" do
      Item.keys.find_all{ |item| [:price, :quantity].include?(item.name) }.each do |key|
        key.options[:firstoption].should == 'this is the first option'
        key.options[:secondoption].should == 'this is the second option'
      end
    end
  end
end