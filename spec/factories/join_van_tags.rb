FactoryBot.define do

  factory :join_van_tag do
    association :van, factory: :van
    association :tag, factory: :tag
  end

end
