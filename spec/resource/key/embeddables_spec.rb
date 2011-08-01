require 'spec_helper'

describe Transcriber::Resource::Embeddables do
  class Invoice < Transcriber::Resource
    embeds_one  :contract,      some_option: 'what'
    embeds_many :invoice_items, some_option: 'what'
  end

  describe ".embeds_one" do
    it "defines an attr_accessor with embeddable name" do
      Invoice.new.tap do |i|
        i.contract = 1
        i.contract.should == 1
      end
    end

    it "puts a new embeddable in keys list" do
      Invoice.keys[0].name.should == :contract
      Invoice.keys[0].options.should == {some_option: 'what', many: false}
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
      Invoice.keys[1].name.should == :invoice_items
      Invoice.keys[1].options.should == {some_option: 'what', many: true}
    end
  end
end
