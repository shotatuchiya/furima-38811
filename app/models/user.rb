class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true
         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :first_name_kana, presence: true
         validates :last_name_kana, presence: true
         validates :birthday, presence: true

         has_many :exhibits
         has_many :purchases
end