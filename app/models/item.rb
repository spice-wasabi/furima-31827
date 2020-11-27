class Item < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :item_name
    validates :item_info
    validates :price
  end
  validates :category_id, numericality: { other_than: 1 } 


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_fee
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :city
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :days_to_ship
end


