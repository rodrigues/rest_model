require 'spec_helper'

describe Transcriber::Resource::Builder::Embeddables do
  before do
    class Example < Transcriber::Resource
      embeds_one  :contract,      some_option: 'contract options'
      embeds_many :invoice_items, some_option: 'invoice options'
    end
  end

  describe ".embeds_one" do
    it "defines an attr_accessor with embeddable name" do
      Example.new.tap do |i|
        i.respond_to?("contract").should be_true
        i.respond_to?("contract=").should be_true
      end
    end

    it "puts a new embeddable in keys list" do
      Example.keys[0].name.should == :contract
    end

    it "supports option definition" do
      Example.keys[0].options.should == {some_option: 'contract options', many: false}
    end

    it "really embeds one" do
      Example.keys[0].options[:many].should be_false
    end
  end

  describe ".embeds_many" do
    it "defines an attr_accessor with embeddable name" do
      Example.new.tap do |example|
        example.respond_to?("invoice_items").should be_true
        example.respond_to?("invoice_items=").should be_true
      end
    end

    it "puts a new embeddable in keys list" do
      Example.keys[1].name.should == :invoice_items
    end

    it "supports option definition" do
      Example.keys[1].options.should == {some_option: 'invoice options', many: true}
    end

    it "really embeds many" do
      Example.keys[1].options[:many].should be_true
    end
  end
end
