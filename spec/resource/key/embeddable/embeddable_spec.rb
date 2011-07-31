require 'spec_helper'

describe Transcriber::Resource::Embeddable do
  describe "#initialize" do
    context "class_name" do
      context "when class_name option is passed" do
        subject do
          Transcriber::Resource::Embeddable.new(:login, class_name: :some_class)
        end

        it "sets passed class_name" do
          subject.instance_variable_get("@class_name").should == "SomeClass"
        end
      end

      context "when class_name option is not passed" do
        subject {Transcriber::Resource::Embeddable.new(:login)}

        it "sets default class_name" do
          subject.instance_variable_get("@class_name").should == "Login"
        end
      end
    end

    context "many" do
      context "when many option is passed with true" do
        subject do
          Transcriber::Resource::Embeddable.new(:login, many: true)
        end

        it "returns false to one?" do
          subject.one?.should be_false
        end

        it "returns true to many?" do
          subject.many?.should be_true
        end
      end

      context "when many option is passed with false" do
        subject do
          Transcriber::Resource::Embeddable.new(:login, many: false)
        end

        it "returns true to one?" do
          subject.one?.should be_true
        end

        it "returns false to many?" do
          subject.many?.should be_false
        end
      end

      context "when many option is not passed" do
        subject do
          Transcriber::Resource::Embeddable.new(:login)
        end

        it "returns true to one?" do
          subject.one?.should be_true
        end

        it "returns false to many?" do
          subject.many?.should be_false
        end
      end
    end
  end
end