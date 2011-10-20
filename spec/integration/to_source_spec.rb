# encoding: utf-8

require "spec_helper"

describe "to_source" do
  describe_example "to_source/simple" do
    it "generates source" do
      @root.to_source[:login].should == "jackiechan2010"
    end
  end

  describe_example "to_source/embeds_many" do
    it "generates source" do
      source = @root.to_source
      source['hidden']['login'].should == "jackiechan2010"
      source["phones"][0].should == {"number" => "123123123", "extension" => "111"}
      source["phones"][1].should == {"number" => "098098098", "extension" => "999"}
    end
  end

  describe_example "to_source/embeds_many_without_key" do
    it "generates source without a key" do
      source = @root.to_source(phones: {without: :description})
      source["phones"][0].should_not have_key("description")
      source["phones"][1].should_not have_key("description")
    end
  end

  describe_example "to_source/embeds_one" do
    it "generates source" do
      source = @root.to_source
      source['hidden']['login'].should == "jackiechan2010"
      source["address"]["street"].should == "Aurora St"
      source["address"]["number"].should == "666"
    end
  end

  describe_example "to_source/serializables" do
    it "generates source" do
      source = @root.to_source
      source["login"].should == "jackiechan2010"
      source["age"].should == 22
      source["birth"].should == "19900704"
      source["active"].should == "X"
      source["services"].should == ["Hosting", "Email"]
      source["balance"].should == 200.00
    end
  end
end
