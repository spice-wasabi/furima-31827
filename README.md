# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| name      | string | null: false |
| name_kana | string | null: false |
| birthday  | date   | null: false |

### Association

- has_many :items
- has_many :buyers



## items テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| image         | ActiveStorageで実装   |
| item_name     | string | null: false |
| item_info     | text   | null: false |
| category      | string | null: false |
| status        | string | null: false |
| delivery_fee  | date   | null: false |
| shipping_area | string | null: false |
| days_to_ship  | string | null: false |
| price         | money  | null: false |
| user_id       | string | null: false |

### Association

- belongs_to :user
- has_one :buyer



## buyers テーブル

| Column           | Type        | Options     |
| ---------------- | ----------- | ----------- |
| card_num         | string      | null: false |
| expiration       | timestamp(4)| null: false |
| security_code    | string      | null: false |
| postal_code      | char(7)     | null: false |
| city             | string      | null: false |
| town             | string      | null: false |
| building_name    | string      |             |
| address          | string      | null: false |
| phone_num        | string      | null: false |
| user_id          | string      | null: false |
| item_id          | string      | null: false |

### Association

- belongs_to :user
- belongs_to :item

