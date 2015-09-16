FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@mail.com" }
    sequence(:password) { |n| "user#{n}" }
  end
end
