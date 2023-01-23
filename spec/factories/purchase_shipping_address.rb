FactoryBot.define do
  factory :purchase_shipping_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code            { '123-4567' }
    sender_id              { 2 }
    municipalitie          { '横浜市' }
    address                { '青山1-1-1' }
    building_name          {' 柳ビル103' }
    telephone_number       { '00000000000' }
  end
end
