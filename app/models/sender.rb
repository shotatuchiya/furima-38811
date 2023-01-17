class Sender < ActiveHash::Base
  self.data = [
    { id: 1, sender: '---' },
    { id: 2, sender: '北海道' }, { id: 3, sender: '青森県' }, { id: 4, sender: '岩手県' },
    { id: 7, sender: '宮城県' }, { id: 6, sender: '秋田県' }, { id: 5, sender: '山形県' },
    { id: 8, sender: '福島県' }, { id: 9, sender: '茨城県' }, { id: 10, sender: '栃木県' },
    { id: 11, sender: '群馬県' }, { id: 12, sender: '埼玉県' }, { id: 13, sender: '千葉県' },
    { id: 14, sender: '東京都' }, { id: 15, sender: '神奈川県' }, { id: 16, sender: '新潟県' },
    { id: 17, sender: '富山県' }, { id: 18, sender: '石川県' }, { id: 19, sender: '福井県' },
    { id: 20, sender: '山梨県' }, { id: 21, sender: '長野県' }, { id: 22, sender: '岐阜県' },
    { id: 23, sender: '静岡県' }, { id: 24, sender: '愛知県' }, { id: 25, sender: '三重県' },
    { id: 26, sender: '滋賀県' }, { id: 27, sender: '京都府' }, { id: 28, sender: '大阪府' },
    { id: 29, sender: '兵庫県' }, { id: 30, sender: '奈良県' }, { id: 31, sender: '和歌山県' },
    { id: 32, sender: '鳥取県' }, { id: 33, sender: '島根県' }, { id: 34, sender: '岡山県' },
    { id: 35, sender: '広島県' }, { id: 36, sender: '山口県' }, { id: 37, sender: '徳島県' },
    { id: 38, sender: '香川県' }, { id: 39, sender: '愛媛県' }, { id: 40, sender: '高知県' },
    { id: 41, sender: '福岡県' }, { id: 42, sender: '佐賀県' }, { id: 43, sender: '長崎県' },
    { id: 44, sender: '熊本県' }, { id: 45, sender: '大分県' }, { id: 46, sender: '宮崎県' },
    { id: 47, sender: '鹿児島県' }, { id: 48, sender: '沖縄県' }
  ]
  include ActiveHash::Associations
  has_many :exhibits
end
