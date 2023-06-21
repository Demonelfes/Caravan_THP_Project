FactoryBot.define do
  factory :rental do
    start_date { Faker::Date.forward(days: 30) }
    end_date { Faker::Date.between(from: '2023-12-31', to: '2025-12-31') }
    total_price { 555 }
    association :customer, factory: :user
    association :owner, factory: :user
    association :van, factory: :van
    created_at { DateTime.now }
    updated_at { DateTime.now + 1 }
  end
end
