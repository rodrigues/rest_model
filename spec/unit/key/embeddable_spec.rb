require 'spec_helper'

describe RestModel::Embeddable do
  it "is a relation" do
    RestModel::Embeddable.superclass.should == RestModel::Association
  end
end
