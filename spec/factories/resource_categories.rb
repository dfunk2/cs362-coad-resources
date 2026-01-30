FactoryBot.define do
  factory :resource_category do
    name { "Category #{Time.now.to_i}#{rand(1000)}" }
    active { true }
  end
end