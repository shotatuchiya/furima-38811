# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| name               | string | null: false                |
| email              | string | null: false , unique: true |
| encrypted_password | string | null: false                |
| first_name         | string | null: false                |
| last_name          | string | null: false                |
| first_name_kana    | string | null: false                |
| last_name_kana     | string | null: false                |
| birthday           | date   | null: false                |

### Association
has_many :exhibit
has_many :purchase

## exhibits テーブル

| Column             | Type   | Options                            |
| ------------------ | ------ | ---------------------------------- |
| user                | references | null: false, foreign_key: true|
| Product_name        | text       | null: false                   |
| Product_description | text       | null: false                   |
| category            | prefecture | null: false                   |
| condition           | prefecture | null: false                   |
| Shipping_charges    | prefecture | null: false                   |
| sender              | prefecture | null: false                   |
| days_to_Ship        | prefecture | null: false                   |
| price               | string     | null: false                   |

### Association
belongs_to :users
belongs_to :purchases

## purchases テーブル

| Column             | Type   | Options                            |
| ------------------ | ------ | ---------------------------------- |
| Postal code        | string | null: false                        |
| prefectures        | prefecture | null: false                    |
| municipalities     | string | null: false                        |
| address            | string | null: false                        |
| building_name      | string |                                    |
| telephone_number   | string | null: false                        |
| user               | references | null: false, foreign_key: true |
| exhibit            | references | null: false, foreign_key: true |

### Association
belongs_to :users
has_many :exhibits