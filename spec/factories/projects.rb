FactoryGirl.define do
  factory :project do
    association :owner, factory: :user
    sequence(:title) { |n| "project#{n}" }
    sequence(:text) { |n| "text#{n}" }
    city "Lviv"
  end

end
