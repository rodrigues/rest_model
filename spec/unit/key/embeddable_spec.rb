require 'spec_helper'

describe RestModel::Embeddable do
  it "is a relation" do
    RestModel::Embeddable.superclass.should == RestModel::Association
  end

  describe "#raw?" do
    context "when class_name is array" do
      subject    {RestModel::Embeddable.new(:example, class_name: :array)}
      its(:raw?) {should be_true}
    end

    context "when class_name is hash" do
      subject    {RestModel::Embeddable.new(:example, class_name: :hash)}
      its(:raw?) {should be_true}
    end

    context "when class_name isn't hash nor array" do
      subject    {RestModel::Embeddable.new(:example)}
      its(:raw?) {should be_false}
    end

    context "when fields are defined" do
      subject      {RestModel::Embeddable.new(:example, fields: %w(a b c))}
      its(:raw?)   {should be_true}
      its(:fields) {should == %w(a b c)}
    end
  end
end
