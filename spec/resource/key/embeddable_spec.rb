require 'spec_helper'

describe Transcriber::Resource::Embeddable do
  it "is a relation" do
    Transcriber::Resource::Embeddable.superclass.should == Transcriber::Resource::Relation
  end
end
