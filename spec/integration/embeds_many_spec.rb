require 'spec_helper'

describe_example 'embeds_many/simple' do
  it 'parses first embedded item' do
    root.items[0].id.should == 2000
  end

  it 'parses second embedded item' do
    root.items[1].id.should == 2001
  end
end


describe_example 'embeds_many/invisible' do
  it 'parses invisible item correctly' do
    root.locale.should == 'pt-BR'
  end

  it "doesn't show embedded items in resource" do
    root.resource.should_not have_key('locale')
  end
end

describe_example 'embeds_many/with_class_name' do

end

describe_example 'embeds_many/with_if' do
end

describe_example 'embeds_many/with_start_key' do
end
