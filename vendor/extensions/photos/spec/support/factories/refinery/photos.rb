
FactoryGirl.define do
  factory :photo, :class => Refinery::Photos::Photo do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

