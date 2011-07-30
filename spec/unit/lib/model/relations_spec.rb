require 'spec_helper'

describe Hashttp::Model::Relations do
  module RelationsExample
    class Item < Hashttp::Model
    end

    class Root < Hashttp::Model
    end
  end

  before do
    RelationsExample::Root.relations.clear
    RelationsExample::Item.relations.clear
  end

  describe ".embeds_one" do
    it "creates a relation" do
      module RelationsExample
        class Item < Hashttp::Model
          property :id
        end

        class Root < Hashttp::Model
          embeds_one :item
        end
      end

      RelationsExample::Root.relations.first.name.should == :item
    end

    it "defines an attr_accessor with relation name" do
      module RelationsExample
        class Item < Hashttp::Model
          property :id
        end

        class Root < Hashttp::Model
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
          class Item < Hashttp::Model
            property :id
          end

          class Root < Hashttp::Model
            embeds_one :item, class_name: 'relations_example/item'
          end
        end

        RelationsExample::Root.relations.first.class_name.should == 'RelationsExample::Item'
      end

      it "uses relation name if class_name option not defined" do
        module RelationsExample
          class Item < Hashttp::Model
            property :id
          end

          class Root < Hashttp::Model
            embeds_one :item
          end
        end

        RelationsExample::Root.relations.first.class_name.should == 'Item'
      end
    end

    it "configures relation start key if defined" do
      module RelationsExample
        class Item < Hashttp::Model
          property :id
        end

        class Root < Hashttp::Model
          embeds_one :item, start_key: :item_sap
        end
      end

      RelationsExample::Root.relations.first.start_key.should == :item_sap
    end

    it "sets relation.one to true and relation.many to false" do
      module RelationsExample
        class Item < Hashttp::Model
          property :id
        end

        class Root < Hashttp::Model
          embeds_one :item
        end
      end

      RelationsExample::Root.relations.first.one.should be_true
      RelationsExample::Root.relations.first.many.should be_false
    end

    it "sets extra options if defined" do
      module RelationsExample
        class Item < Hashttp::Model
          property :id
        end

        class Root < Hashttp::Model
          embeds_one :item, restricted: 'admin'
        end
      end

      RelationsExample::Root.relations.first.options[:restricted].should == 'admin'
    end
  end

  describe ".embeds_many" do
    it "creates a relation" do
      module RelationsExample
        class Item < Hashttp::Model
          property :id
        end

        class Root < Hashttp::Model
          embeds_many :item
        end
      end

      RelationsExample::Root.relations.first.name.should == :item
    end

    it "defines an attr_accessor with relation name" do
      module RelationsExample
        class Item < Hashttp::Model
          property :id
        end

        class Root < Hashttp::Model
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
          class Item < Hashttp::Model
            property :id
          end

          class Root < Hashttp::Model
            embeds_many :item, class_name: 'relations_example/item'
          end
        end

        RelationsExample::Root.relations.first.class_name.should == 'RelationsExample::Item'
      end

      it "uses relation name if class_name option not defined" do
        module RelationsExample
          class Item < Hashttp::Model
            property :id
          end

          class Root < Hashttp::Model
            embeds_many :item
          end
        end

        RelationsExample::Root.relations.first.class_name.should == 'Item'
      end
    end

    it "configures relation start key if defined" do
      module RelationsExample
        class Item < Hashttp::Model
          property :id
        end

        class Root < Hashttp::Model
          embeds_many :item, start_key: :item_sap
        end
      end

      RelationsExample::Root.relations.first.start_key.should == :item_sap
    end

    it "sets relation.one to false and relation.many to true" do
      module RelationsExample
        class Item < Hashttp::Model
          property :id
        end

        class Root < Hashttp::Model
          embeds_many :item
        end
      end

      RelationsExample::Root.relations.first.one.should be_false
      RelationsExample::Root.relations.first.many.should be_true
    end

    it "sets extra options if defined" do
      module RelationsExample
        class Item < Hashttp::Model
          property :id
        end

        class Root < Hashttp::Model
          embeds_many :item, restricted: 'admin'
        end
      end

      RelationsExample::Root.relations.first.options[:restricted].should == 'admin'
    end
  end
end