class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :sender_id, :municipalitie, :address, :building_name, :telephone_number, :exhibit_id, :user_id, :token

  with_options presence: true do
    validates :user_id
    validates :exhibit_id
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'を次のように入力します(123-1234)' }
    validates :sender_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :municipalitie
    validates :address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'が短すぎます' },
                                 numericality: { with: /\A[0-9]+\z/, message: 'を半角数字で入力してください' }
  end

  def save
    purchase = Purchase.create(user_id: user_id, exhibit_id: exhibit_id)
    ShippingAddress.create(postal_code: postal_code, sender_id: sender_id, municipalitie: municipalitie, address: address,
                           building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end
