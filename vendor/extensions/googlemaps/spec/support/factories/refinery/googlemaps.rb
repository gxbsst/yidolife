
FactoryGirl.define do
  factory :googlemap, :class => Refinery::Googlemaps::Googlemap do
    sequence(:address) { |n| "refinery#{n}" }
  end
end

