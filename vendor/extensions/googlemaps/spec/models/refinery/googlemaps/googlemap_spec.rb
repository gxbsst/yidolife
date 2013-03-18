require 'spec_helper'

module Refinery
  module Googlemaps
    describe Googlemap do
      describe "validations" do
        subject do
          FactoryGirl.create(:googlemap,
          :address => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:address) { should == "Refinery CMS" }
      end
    end
  end
end
