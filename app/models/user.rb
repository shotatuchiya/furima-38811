class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は文字と数字の両方を含んでください'
  validates :name, presence: true
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  validates :first_name, presence: true
  validates_format_of :first_name, with: NAME_REGEX, message: 'は全角文字で入力してください'
  validates :last_name, presence: true
  validates_format_of :last_name, with: NAME_REGEX, message: 'は全角文字で入力してください'
  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :first_name_kana, presence: true
  validates_format_of :first_name_kana, with: NAME_KANA_REGEX, message: 'は全角カタカナで入力してください'
  validates :last_name_kana, presence: true
  validates_format_of :last_name_kana, with: NAME_KANA_REGEX, message: 'は全角カタカナで入力してください'
  validates :birthday, presence: true

  has_many :exhibits
  has_many :purchases
end
