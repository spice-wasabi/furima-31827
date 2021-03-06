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
- has_many :orders



## items テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| item_name        | string  | null: false                    |
| item_info        | text    | null: false                    |
| category_id      | integer | null: false                    |
| status_id        | integer | null: false                    |
| delivery_fee_id  | integer | null: false                    |
| city_id          | integer | null: false                    |
| days_to_ship_id  | integer | null: false                    |
| price            | integer | null: false                    |
| user_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order



## buyers テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| postal_code      | string      | null: false                    |
| city_id          | integer     | null: false                    |
| town             | string      | null: false                    |
| building_name    | string      |                                |
| address          | string      | null: false                    |
| phone_num        | string      | null: false                    |
| order_id         | integer     | null: false, foreign_key: true |

### Association

- belongs_to :order



## orders テーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| user_id     | integer     | null: false, foreign_key: true |
| item_id     | integer     | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer