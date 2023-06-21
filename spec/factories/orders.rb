FactoryBot.define do

  factory :order do
    association :rental, factory: :rental
  end

end
