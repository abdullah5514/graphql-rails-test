FactoryBot.define do
  factory :book do
    sequence(:title) { |n| "Best book ever (#{n})" }
    publish_year { 1984 }
    genre { 'Thriller' }
    author
  end
end