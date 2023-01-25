class Exhibit < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :sender
  belongs_to :days_to_ship

  validates :image, presence: true
  validates :product_name, presence: true, length: { maximum: 40 }
  validates :product_description, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :condition_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :shipping_charge_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :sender_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :days_to_ship_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: 'を半角数字で入力してください' },
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
