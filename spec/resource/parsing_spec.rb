require 'spec_helper'

describe Transcriber::Resource::Parsing do
  class Example < Transcriber::Resource
  end

  before { Example.keys.clear }

  describe '.parse' do
    it 'parses simple properties' do
      class Example < Transcriber::Resource
        property :login
      end

      models = Example.parse({'LOGIN' => 'jackiechan2010'})
      models.should be_an(Array)
      models.first.login.should == 'jackiechan2010'
    end

    it 'uses different field name if defined' do
      class Example < Transcriber::Resource
        property :login, field: :customer_login
      end

      models = Example.parse({'CUSTOMER_LOGIN' => 'jackiechan2010'})
      models.should be_an(Array)
      models.first.login.should == 'jackiechan2010'
    end

    context "uses type defined" do
      context 'boolean' do
        before do
          class Example < Transcriber::Resource
            property :can_merge, type: Boolean
          end
        end

        it "returns true when value is 'X'" do
          models = Example.parse({'CAN_MERGE' => 'X'})
          models.first.can_merge.should be_true
        end

        it "returns false when value isn't 'X'" do
          models = Example.parse({'CAN_MERGE' => ''})
          models.first.can_merge.should be_false
        end
      end

      context "date" do
        it "parse" do
          class Example < Transcriber::Resource
            property :issue_date, type: Date
          end

          models = Example.parse({'ISSUE_DATE' => '2011-01-01'})
          models.first.issue_date.should == Date.parse('2011-01-01')
        end
      end

      context "float" do
        it "parse" do
          class Example < Transcriber::Resource
            property :amount, type: Float
          end

          models = Example.parse({'AMOUNT' => '1234.5'})
          models.first.amount.should == 1234.5
        end
      end
    end

    context "maps values if defined" do
      before do
        class Example < Transcriber::Resource
          property :status, values: {paid: '01', unpaid: '02'}
        end
      end

      it "returns key when value was mapped" do
        models = Example.parse({'STATUS' => '02'})
        models.first.status.should == :unpaid
      end

      it "returns nil when value wasn't mapped" do
        models = Example.parse({'STATUS' => '03'})
        models.first.status.should be_nil
      end
    end
  end
end