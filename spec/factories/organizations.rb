FactoryBot.define do
  factory :organization do
    sequence(:name) { |n| "Organization #{n}" }
    sequence(:email) { |n| "org#{n}@example.com" }
    phone { "503-555-1234" }
    description { "A helpful organization" }
    status { :approved }
    liability_insurance { true }
    primary_name { "Jane Smith" }
    secondary_name { "John Smith" }
    secondary_phone { "503-555-5678" }
    title { "Director" }
    transportation { :yes }
  end
end