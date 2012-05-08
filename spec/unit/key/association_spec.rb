require 'spec_helper'

describe RestModel::Association do
  describe "#initialize" do
    context "options[:class_name]" do
      context "when it's passed" do
        subject do
          RestModel::Association.new(:login, class_name: :some_class)
        end

        it "sets class_name" do
          subject.instance_variable_get("@class_name").should == "SomeClass"
        end
      end

      context "when it isn't passed" do
        subject {RestModel::Association.new(:login)}

        it "uses default class_name" do
          subject.instance_variable_get("@class_name").should == "Login"
        end
      end
    end

    context "options[:many]" do
      context "when it's true" do
        subject {RestModel::Association.new(:login, many: true)}
        its(:one?)  {should be_false}
        its(:many?) {should be_true}
      end

      context "when it's false" do
        subject {RestModel::Association.new(:login, many: false)}
        its(:one?)  {should be_true}
        its(:many?) {should be_false}
      end

      context "when it isn't passed" do
        subject {RestModel::Association.new(:login)}
        its(:one?)  {should be_true}
        its(:many?) {should be_false}
      end
    end
  end
end
