require 'spec_helper'

describe "validations" do
  describe_example "validations/simple" do
    describe "#to_source!" do
      it "raise a RestModel::SourceError" do
        expected_message = {
          some_date: "value 'some invalid date' is an invalid date",
          services: {
            0 => {
              code: "value 'non integer (S0)' is not an integer",
              products: {
                0 => {
                  created_at: "value 'non datetime (P0)' is an invalid date time"
                },
                1 => {
                  value: "value 'non float (P1)' is not a float"
                }
              }
            }
          }
        }

        proc {@root.to_source!}.should raise_error(RestModel::SourceError) {|e| e.message.should == expected_message}
      end
    end
  end
end
