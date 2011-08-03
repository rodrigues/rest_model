require 'spec_helper'

describe Configuration do
  after(:all) do
    Transcriber.configuration.convert_input_keys = nil
  end

  context "when no custom input keys converter is set" do
    it "returns default key converter" do
      default_handler = Transcriber::Configuration::DefaultHandler
      Transcriber.configuration.convert_input_keys.should == default_handler
    end
  end

  context "when a custom input keys converter is set" do
    let(:custom_convert_input_keys) {lambda {|keys| keys}}

    before {Transcriber.configuration.convert_input_keys = custom_convert_input_keys}

    it "returns custom key converter" do
      Transcriber.configuration.convert_input_keys.should == custom_convert_input_keys
    end
  end
end
