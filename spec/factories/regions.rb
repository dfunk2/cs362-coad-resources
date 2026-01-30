FactoryBot.define do
  factory :region do
    name { "Region #{Time.now.to_i}#{rand(1000)}" }
  end
end