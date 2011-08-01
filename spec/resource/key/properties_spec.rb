require 'spec_helper'

describe Transcriber::Resource::Properties do
  class Receipt < Transcriber::Resource
    property :document_number, some_option: 'this is an option'
  end
  
  describe ".property" do
    it "defines an attr_accessor with property name" do
      Receipt.new.tap do |receipt|
        receipt.respond_to?("document_number").should be_true
        receipt.respond_to?("document_number=").should be_true
      end
    end
    
    it "puts a new property in keys list" do
      Receipt.keys.find { |key| key.name == :document_number }.should_not be_nil
    end
    
    it "supports option definition" do
      Receipt.keys.find { |key| key.name == :document_number }.options[:some_option].should == 'this is an option'
    end
  end
  
  describe ".properties" do
    class Item < Transcriber::Resource
      properties :id, :description
      properties :price, :quantity, first_option: 'this is the first option', second_option: 'this is the second option'
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
        key.options[:first_option].should == 'this is the first option'
        key.options[:second_option].should == 'this is the second option'
      end
    end
  end
end