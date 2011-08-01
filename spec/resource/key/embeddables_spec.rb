require 'spec_helper'

describe Transcriber::Resource::Embeddables do
  class Invoice < Transcriber::Resource
    embeds_one  :contract,      some_option: 'contract options'
    embeds_many :invoice_items, some_option: 'invoice options'
  end

  describe ".embeds_one" do
    it "defines an attr_accessor with embeddable name" do
      Invoice.new.tap do |invoice|
        invoice.respond_to?("contract").should be_true
        invoice.respond_to?("contract=").should be_true
      end
    end

    it "puts a new embeddable in keys list" do
      Invoice.keys.find { |key| key.name == :contract }.should_not be_nil
    end
    
    it "supports option definition" do
      Invoice.keys.find { |key| key.name == :contract }.options[:some_option].should == 'contract options'
    end
    
    it "really embeds one" do
      Invoice.keys.find { |key| key.name == :contract }.options[:many].should be_false
    end
  end

  describe ".embeds_many" do
    it "defines an attr_accessor with embeddable name" do
      Invoice.new.tap do |i|
        i.invoice_items = []
        i.invoice_items.should == []
      end
    end

    it "puts a new embeddable in keys list" do
      Invoice.keys.find { |key| key.name == :invoice_items }.should_not be_nil
    end
    
    it "supports option definiton" do
      Invoice.keys.find { |key| key.name == :invoice_items }.options[:some_option].should == 'invoice options'
    end
    
    it "really embeds many" do
      Invoice.keys.find { |key| key.name == :invoice_items }.options[:many].should be_true
    end
  end
end