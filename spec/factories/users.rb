FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '名前' }
    last_name             { '全角' }
    first_name_kana       { 'カナ' }
    last_name_kana        { 'カナ' }
    birthday              { '1930/01/01' }
  end
end
