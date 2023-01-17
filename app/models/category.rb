class Category < ActiveHash::Base
  self.data = [
    { id: 1, categyor: '---' },
    { id: 2, categyor: 'レディース' },
    { id: 3, categyor: 'メンズ' },
    { id: 4, categyor: 'ベビー・キッズ' },
    { id: 5, categyor: 'インテリア・住まい・小物' },
    { id: 6, categyor: '本・音楽・ゲーム' },
    { id: 7, categyor: 'おもちゃ・ホビー・グッズ' },
    { id: 8, categyor: '家電・スマホ・カメラ' },
    { id: 9, categyor: 'スポーツ・レジャー' },
    { id: 10, categyor: 'ハンドメイド' },
    { id: 11, categyor: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :exhibits
end
