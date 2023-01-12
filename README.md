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

has_many :exhibits
has_many :purchases

## exhibits テーブル

| Column             | Type   | Options                            |
| ------------------ | ------ | ---------------------------------- |
| user                | references | null: false, foreign_key: true|
| product_name        | string     | null: false                   |
| product_description | text       | null: false                   |
| category_id         | integer    | null: false                   |
| condition_id        | integer    | null: false                   |
| shipping_charges_id | integer    | null: false                   |
| sender_id           | integer    | null: false                   |
| days_to_Ship_id     | integer    | null: false                   |
| price               | integer    | null: false                   |

### Association

belongs_to :user
has_one :purchase

## purchases テーブル

| Column             | Type   | Options                            |
| ------------------ | ------ | ---------------------------------- |
| user               | references | null: false, foreign_key: true |
| exhibit            | references | null: false, foreign_key: true |
| shipping_addresse  | references | null: false, foreign_key: true |

### Association

belongs_to :user
has_one :shipping_address
belongs_to :exhibit

## shipping_addresses テーブル

| Column             | Type   | Options                            |
| ------------------ | ------ | ---------------------------------- |
| postal_code        | string | null: false                        |
| sender_id          | integer | null: false                       |
| municipalities     | string | null: false                        |
| address            | string | null: false                        |
| building_name      | string |                                    |
| telephone_number   | string | null: false                        |
| purchases          | references | null: false, foreign_key: true |

### Association

belongs_to :purchase
