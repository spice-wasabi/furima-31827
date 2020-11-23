# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :buyers



## items テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| item_name        | string  | null: false                    |
| item_info        | text    | null: false                    |
| category_id      | string  | null: false                    |
| status_id        | string  | null: false                    |
| delivery_fee_id  | date    | null: false                    |
| shipping_area_id | string  | null: false                    |
| days_to_ship_id  | string  | null: false                    |
| price            | integer | null: false                    |
| user_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer



## buyers テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| postal_code      | char(7)     | null: false                    |
| city             | string      | null: false                    |
| town             | string      | null: false                    |
| building_name    | string      |                                |
| address          | string      | null: false                    |
| phone_num        | string      | null: false                    |
| user_id          | integer     | null: false, foreign_key: true |
| item_id          | integer     | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

