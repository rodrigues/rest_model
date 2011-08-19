require 'spec_helper'

describe_example "embeds_one/simple" do
  it 'parses properly' do
    root.item.id.should == "2000"
  end
end

describe_example "embeds_one/with_class_name" do
  it 'parses properly' do
    root.item.id.should == "2000"
  end
end

describe_example "embeds_one/with_if" do
  it 'parses @root_with_item properly' do
    root_with_item.id.should == "1"
    root_with_item.item.id.should == "2000"
  end

  it 'parses @root_without_item properly' do
    puts "without_item: #{root_without_item.item}"
    root_without_item.id.should == "100"
    root_without_item.item.should_not be
  end
end

describe_example "embeds_one/with_start_key" do
  it 'parses properly' do
    root.item.id.should == "2000"
  end
end


__END__

class Entry < Transcriber::Resource
  property :id
end

class Root < Transcriber::Resource
  embeds_one :item, class_name: :entry
end

@root = Root.parse({"item" => {"id" => 2000}}).first

puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"
