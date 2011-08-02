require 'spec_helper'

describe Transcriber::Resource::Association do
  it "is a relation" do
    Transcriber::Resource::Association.superclass.should == Transcriber::Resource::Relation
  end
end
