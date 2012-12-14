
FactoryGirl.define do
  factory :feedback, :class => Refinery::Feedbacks::Feedback do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

