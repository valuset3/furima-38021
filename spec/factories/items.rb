FactoryBot.define do
  factory :item do
    name              { Faker::Name.initials(number: 2) }
    description       { Faker::Lorem.sentence }
    category_id       { 2 }
    status_id         { 2 }
    shipping_cost_id  { 2 }
    prefecture_id     { 2 }
    shipping_day_id   { 2 }
    price             { 300 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
