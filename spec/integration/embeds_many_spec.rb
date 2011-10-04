# encoding: utf-8

require "spec_helper"

describe_example "embeds_many/simple" do
  it "parses first embedded item" do
    root.items[0].id.should == 2000
  end

  it "parses second embedded item" do
    root.items[1].id.should == 2001
  end
end

describe_example "embeds_many/invisible" do
  it "parses invisible items correctly" do
    root.locale.should == "pt-BR"
    root.names.should == {"en"=>"Woot", "pt-BR"=>"Úia", "es"=>"Me gusta"}
  end

  it "doesn't show embedded items in resource" do
    root.resource.should_not have_key("locale")
    root.resource.should_not have_key("names")
  end
end

describe_example "embeds_many/with_array" do
  it ""
end

describe_example "embeds_many/with_class_name" do
  it "parses embedded item" do
    root.items[0].id.should == 2000
  end
end

describe_example "embeds_many/with_if" do
  context "when an embeddable has a conditional proc (:if)" do
    context "and it evaluates to true" do
      it "parses embedded item" do
        root_with_items.items.first.id.should == "2000"
      end
    end

    context "and it evaluates to false" do
      it "doesn't parse embedded item" do
        root_without_items.items.should_not be
      end
    end
  end
end

describe_example "embeds_many/with_start_key" do
  it "parses embedded items" do
    root.items.first.id.should == "2000"
  end
end
