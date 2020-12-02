class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
    validates :price, numericality: true, inclusion: { in: 300..9999999 } 
  end
  
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :city_id
    validates :days_to_ship_id
  end

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


