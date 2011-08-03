require 'spec_helper'

describe "has many" do
  context_from_example "has_many/simple" do
    it "sets root" do
      root.resource.should be_a(Hash)
    end
  end
end
