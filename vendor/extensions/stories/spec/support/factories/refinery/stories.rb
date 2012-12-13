
FactoryGirl.define do
  factory :story, :class => Refinery::Stories::Story do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

