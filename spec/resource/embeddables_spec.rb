require 'spec_helper'

describe Transcriber::Resource::Embeddables do
  module RelationsExample
    class Item < Transcriber::Resource
    end

    class Root < Transcriber::Resource
    end
  end

  before do
    RelationsExample::Root.keys.clear
    RelationsExample::Item.keys.clear
  end

  describe ".embeds_one" do
    it "creates a relation" do
      module RelationsExample
        class Item < Transcriber::Resource
          property :id
        end

        class Root < Transcriber::Resource
          embeds_one :item
        end
      end

      RelationsExample::Root.keys.first.name.should == :item
    end

    it "defines an attr_accessor with relation name" do
      module RelationsExample
        class Item < Transcriber::Resource
          property :id
        end

        class Root < Transcriber::Resource
          embeds_one :item
        end
      end

      RelationsExample::Root.new.tap do |r|
        r.item = RelationsExample::Item.new(id: 2)
        r.item.id.should == 2
      end
    end

    context "configures class name" do
      it "uses class_name option if defined" do
        module RelationsExample
          class Item < Transcriber::Resource
            property :id
          end

          class Root < Transcriber::Resource
            embeds_one :item, class_name: 'relations_example/item'
          end
        end

        RelationsExample::Root.keys.first.class_name.should == 'RelationsExample::Item'
      end

      it "uses relation name if class_name option not defined" do
        module RelationsExample
          class Item < Transcriber::Resource
            property :id
          end

          class Root < Transcriber::Resource
            embeds_one :item
          end
        end

        RelationsExample::Root.keys.first.class_name.should == 'Item'
      end
    end

    it "configures relation start key if defined" do
      module RelationsExample
        class Item < Transcriber::Resource
          property :id
        end

        class Root < Transcriber::Resource
          embeds_one :item, start_key: :item_sap
        end
      end

      RelationsExample::Root.keys.first.start_key.should == :item_sap
    end

    it "sets relation.one to true and relation.many to false" do
      module RelationsExample
        class Item < Transcriber::Resource
          property :id
        end

        class Root < Transcriber::Resource
          embeds_one :item
        end
      end

      RelationsExample::Root.keys.first.one.should be_true
      RelationsExample::Root.keys.first.many.should be_false
    end

    it "sets extra options if defined" do
      module RelationsExample
        class Item < Transcriber::Resource
          property :id
        end

        class Root < Transcriber::Resource
          embeds_one :item, restricted: 'admin'
        end
      end

      RelationsExample::Root.keys.first.options[:restricted].should == 'admin'
    end
  end

  describe ".embeds_many" do
    it "creates a relation" do
      module RelationsExample
        class Item < Transcriber::Resource
          property :id
        end

        class Root < Transcriber::Resource
          embeds_many :item
        end
      end

      RelationsExample::Root.keys.first.name.should == :item
    end

    it "defines an attr_accessor with relation name" do
      module RelationsExample
        class Item < Transcriber::Resource
          property :id
        end

        class Root < Transcriber::Resource
          embeds_many :item
        end
      end

      RelationsExample::Root.new.tap do |r|
        r.item = RelationsExample::Item.new(id: 2)
        r.item.id.should == 2
      end
    end

    context "configures class name" do
      it "uses class_name option if defined" do
        module RelationsExample
          class Item < Transcriber::Resource
            property :id
          end

          class Root < Transcriber::Resource
            embeds_many :item, class_name: 'relations_example/item'
          end
        end

        RelationsExample::Root.keys.first.class_name.should == 'RelationsExample::Item'
      end

      it "uses relation name if class_name option not defined" do
        module RelationsExample
          class Item < Transcriber::Resource
            property :id
          end

          class Root < Transcriber::Resource
            embeds_many :item
          end
        end

        RelationsExample::Root.keys.first.class_name.should == 'Item'
      end
    end

    it "configures relation start key if defined" do
      module RelationsExample
        class Item < Transcriber::Resource
          property :id
        end

        class Root < Transcriber::Resource
          embeds_many :item, start_key: :item_sap
        end
      end

      RelationsExample::Root.keys.first.start_key.should == :item_sap
    end

    it "sets relation.one to false and relation.many to true" do
      module RelationsExample
        class Item < Transcriber::Resource
          property :id
        end

        class Root < Transcriber::Resource
          embeds_many :item
        end
      end

      RelationsExample::Root.keys.first.one.should be_false
      RelationsExample::Root.keys.first.many.should be_true
    end

    it "sets extra options if defined" do
      module RelationsExample
        class Item < Transcriber::Resource
          property :id
        end

        class Root < Transcriber::Resource
          embeds_many :item, restricted: 'admin'
        end
      end

      RelationsExample::Root.keys.first.options[:restricted].should == 'admin'
    end
  end
end