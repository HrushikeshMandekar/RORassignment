FactoryBot.define do

  factory :tutor do
    sequence(:name) { |n| "Name#{n}" }
  end
end
