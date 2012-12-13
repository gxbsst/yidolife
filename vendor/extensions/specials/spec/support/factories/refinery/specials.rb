
FactoryGirl.define do
  factory :special, :class => Refinery::Specials::Special do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

