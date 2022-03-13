FactoryBot.define do
  factory :author do
    sequence(:first_name) { |n| "John (#{n})" }
    sequence(:sur_name) { |n| "Smith (#{n})" }
    sequence(:birth_year) { 40.years.ago }
  end
end