FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password123" }
    role { 1 }
    confirmed_at { Time.now }
    
    trait :admin do
      role { 0 }
    end
  end
end