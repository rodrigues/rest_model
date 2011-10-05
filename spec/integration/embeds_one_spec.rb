require 'spec_helper'

describe "embeds_one" do
  describe_example "embeds_one/simple" do
    it 'parses embedded item' do
      root.item.id.should == "2000"
    end
  end

  describe_example "embeds_one/with_class_name" do
    context 'when a different class name is used for embeddable' do
      it 'parses embedded item' do
        root.item.id.should == "2000"
      end
    end
  end

  describe_example "embeds_one/with_if" do
    context 'when an embeddable has a conditional proc (:if)' do
      context 'and it evaluates to true' do
        it 'parses embedded item' do
          root_with_item.id.should == "1"
          root_with_item.item.id.should == "2000"
        end
      end

      context 'and it evaluates to false' do
        it "doesn't parse embedded item" do
          root_without_item.id.should == "100"
          root_without_item.item.should_not be
        end
      end
    end
  end

  describe_example "embeds_one/with_start_key" do
    context 'when there is a start key to parse input' do
      it 'parses embedded item' do
        root.item.id.should == "2000"
      end
    end
  end
end
