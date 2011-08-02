require 'spec_helper'

describe Transcriber::Resource::Relation do
  it "is a relation" do
    Transcriber::Resource::Relation.superclass.should == Transcriber::Resource::Association
  end

  describe "#has?" do
    context "when it has one resource" do
      subject do
        Transcriber::Resource::Relation.new(:service, many: false, has: true)
      end

      it "returns true" do
        subject.has?.should be_true
      end
    end

    context "when it has many resources" do
      subject do
        Transcriber::Resource::Relation.new(:service, many: true, has: true)
      end

      it "returns true" do
        subject.has?.should be_true
      end
    end

    context "when it belongs to a resource" do
      subject do
        Transcriber::Resource::Relation.new(:service, many: false, has: false)
      end

      it "returns true" do
        subject.has?.should be_false
      end
    end
  end

  describe "#belongs?" do
    context "when it belongs to a resource" do
      subject do
        Transcriber::Resource::Relation.new(:service, many: false, has: false)
      end

      it "returns true" do
        subject.belongs?.should be_true
      end
    end

    context "when it has one resource" do
      subject do
        Transcriber::Resource::Relation.new(:service, many: false, has: true)
      end

      it "returns true" do
        subject.belongs?.should be_false
      end
    end

    context "when it has many resources" do
      subject do
        Transcriber::Resource::Relation.new(:service, many: true, has: true)
      end

      it "returns true" do
        subject.belongs?.should be_false
      end
    end
  end
end
