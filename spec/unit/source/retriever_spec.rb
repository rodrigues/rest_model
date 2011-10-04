require 'spec_helper'

describe RestModel::Source::Retriever do
  describe '.parse' do
    it 'parses simple properties' do
      class Example < RestModel
        property :login
      end

      models = Example.parse({login: 'jackiechan2010'})
      models.should be_an(Array)
      models.first.login.should == 'jackiechan2010'
    end

    it 'uses different field name if defined' do
      class Example < RestModel
        property :login, field: :customer_login
      end

      models = Example.parse({customer_login: 'jackiechan2010'})
      models.should be_an(Array)
      models.first.login.should == 'jackiechan2010'
    end

    context "uses type defined" do
      context 'boolean' do
        before do
          class Example < RestModel
            property :can_merge, type: Boolean
          end
        end

        it "returns true when value is 'X'" do
          models = Example.parse({can_merge: 'X'})
          models.first.can_merge.should be_true
        end

        it "returns false when value isn't 'X'" do
          models = Example.parse({can_merge: ''})
          models.first.can_merge.should be_false
        end
      end

      context "date" do
        it "parse" do
          class Example < RestModel
            property :issue_date, type: Date
          end

          models = Example.parse({issue_date: '2011-01-01'})
          models.first.issue_date.should == Date.parse('2011-01-01')
        end
      end

      context "float" do
        it "parse" do
          class Example < RestModel
            property :amount, type: Float
          end

          models = Example.parse({amount: '1234.5'})
          models.first.amount.should == 1234.5
        end
      end
    end

    context "maps values if defined" do
      before do
        class Example < RestModel
          property :status, values: {paid: '01', unpaid: '02'}
        end
      end

      it "returns key when value was mapped" do
        models = Example.parse({status: '02'})
        models.first.status.should == :unpaid
      end

      it "returns nil when value wasn't mapped" do
        models = Example.parse({status: '03'})
        models.first.status.should be_nil
      end
    end
  end
end
