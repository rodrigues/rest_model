require 'spec_helper'

describe Transcriber::Resource::Converter do
  after(:all) do
    Transcriber::Resource.convert_input_keys = nil
  end

  context "when no custom input keys converter is set" do
    it "returns default key converter" do
      default_handler = Transcriber::Resource::Key::Converter::DefaultHandler
      Transcriber::Resource.convert_input_keys.should == default_handler
    end
  end

  context "when a custom input keys converter is set" do
    let(:custom_convert_input_keys) {lambda {|keys| keys}}

    before {Transcriber::Resource.convert_input_keys = custom_convert_input_keys}

    it "returns custom key converter" do
      Transcriber::Resource.convert_input_keys.should == custom_convert_input_keys
    end
  end
end
