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
- has_many :purchases



## items テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| item_name        | string  | null: false                    |
| item_info        | text    | null: false                    |
| category_id      | integer | null: false                    |
| status_id        | integer | null: false                    |
| delivery_fee_id  | integer | null: false                    |
| shipping_area_id | integer | null: false                    |
| days_to_ship_id  | integer | null: false                    |
| price            | integer | null: false                    |
| user_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one_attached :purchase



## buyers テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| postal_code      | char(7)     | null: false                    |
| city             | integer     | null: false                    |
| town             | string      | null: false                    |
| building_name    | string      |                                |
| address          | string      | null: false                    |
| phone_num        | string      | null: false                    |
| purchase_id      | integer     | null: false, foreign_key: true |

### Association

- has_one_attached :purchase



## purchases テーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| user_id     | integer     | null: false, foreign_key: true |
| item_id     | integer     | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one_attached :buyer