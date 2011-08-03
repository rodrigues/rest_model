require 'spec_helper'

describe Resource::Converter do
  after(:all) do
    Resource.convert_input_keys = nil
  end

  context "when no custom input keys converter is set" do
    it "returns default key converter" do
      default_handler = Resource::Key::Converter::DefaultHandler
      Resource.convert_input_keys.should == default_handler
    end
  end

  context "when a custom input keys converter is set" do
    let(:custom_convert_input_keys) {lambda {|keys| keys}}

    before {Resource.convert_input_keys = custom_convert_input_keys}

    it "returns custom key converter" do
      Resource.convert_input_keys.should == custom_convert_input_keys
    end
  end
end
