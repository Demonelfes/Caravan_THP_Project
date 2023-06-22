FactoryBot.define do

  factory :van do
    title {"Van de toto"}
    description {"ceci est le van de toto il est bo"}
    city {"Ici"}
    brand {"marque"}
    registration {"AA-123-BB"}
    year {"1990"}
    energy {"fuel"}
    bed_number {3}
    price_per_day {5}
    id {1}
    slug {"youpi"}
    association :user, factory: :user

    after(:create) do |van|
      create(:rental, van: van)
    end
  end

end
