FactoryBot.define do

  factory :tag do
    title {"youpi"}
    created_at {DateTime.now}
    updated_at {DateTime.now + 1}
  end

end
