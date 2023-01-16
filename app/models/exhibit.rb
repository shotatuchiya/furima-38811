class Exhibit < ApplicationRecord
  belongs_to :user
  # has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :image, presence: true
  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sender_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: "Input half-width characters" }, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

end
