# encoding: utf-8

require "spec_helper"

describe "to_source" do
  describe_example "to_source/simple" do
    it "generates source" do
      root.to_source[:login].should == "jackiechan2010"
    end
  end

  describe_example "to_source/embeds_many" do
    it "generates source" do
      source = root.to_source
      source['hidden']['login'].should == "jackiechan2010"
      source["phones"][0].should == {"number" => "123123123", "extension" => "111"}
      source["phones"][1].should == {"number" => "098098098", "extension" => "999"}
    end
  end
end