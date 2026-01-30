FactoryBot.define do
  factory :ticket do
    sequence(:name) { |n| "Person #{n}" }
    phone { "+15035551234" }
    description { "Need help with snow removal" }
    closed { false }
    
    region
    resource_category
  end
end