require 'spec_helper'

describe RestModel::Relation do
  it "is a relation" do
    RestModel::Relation.superclass.should == RestModel::Association
  end

  describe "#has? and #belongs?" do
    context "when it has one resource" do
      subject        {RestModel::Relation.new(:service, many: false, has: true)}
      its(:has?)     {should be_true}
      its(:belongs?) {should be_false}
    end

    context "when it has many resources" do
      subject        {RestModel::Relation.new(:service, many: true, has: true)}
      its(:has?)     {should be_true}
      its(:belongs?) {should be_false}
    end

    context "when it belongs to a resource" do
      subject        {RestModel::Relation.new(:service, many: false, has: false)}
      its(:has?)     {should be_false}
      its(:belongs?) {should be_true}
    end
  end

  context "#relation?" do
    subject {RestModel::Relation.new(:example)}
    its(:relation?) {should be_true}
  end
end
