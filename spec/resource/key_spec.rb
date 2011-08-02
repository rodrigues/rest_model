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

  describe "present?" do
    context "when :if option was defined with a proc" do
      context "and it evaluates to false" do
        subject {Transcriber::Resource::Property.new(name, {if: proc {false}})}

        it "returns false" do
          subject.present?(nil).should be_false
        end
      end

      context "and it evaluates to true" do
        subject {Transcriber::Resource::Property.new(name, {if: proc {true}})}

        it "returns true" do
          subject.present?(nil).should be_true
        end
      end

      context "and it depends on resource instance" do
        subject {Transcriber::Resource::Property.new(name, {if: proc {show}})}

        it "uses it" do
          resource = OpenStruct.new
          resource.show = true
          subject.present?(resource).should be_true
        end
      end
    end
  end
end