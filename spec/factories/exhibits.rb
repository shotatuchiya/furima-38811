FactoryBot.define do
  factory :exhibit do
    product_name          { Faker::Name.initials(number: 40) }
    product_description   { Faker::Marketing.buzzwords }
    category_id           { 2 }
    condition_id          { 2 }
    shipping_charge_id    { 2 }
    sender_id             { 2 }
    days_to_ship_id       { 2 }
    price                 { Faker::Number.number(digits: 4) }
    association :user

    after(:build) do |exhibit|
      exhibit.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
