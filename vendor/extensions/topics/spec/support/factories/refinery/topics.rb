
FactoryGirl.define do
  factory :topic, :class => Refinery::Topics::Topic do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

