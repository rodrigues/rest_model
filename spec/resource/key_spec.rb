require 'spec_helper'

describe Transcriber::Resource::Key do
  let(:name)    {"key_name"}
  let(:options) {{any_option: "here"}}

  subject {Transcriber::Resource::Property.new(name, options)}

  describe "#initialize" do
    it "sets key name" do
      subject.name.should == name
    end

    it "sets options" do
      subject.options.should == options
    end
  end
end