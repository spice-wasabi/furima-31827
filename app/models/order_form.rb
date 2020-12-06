class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :city_id, :town, :building_name, :address, :phone_num,
                :order_id, :user_id, :item_id

# buyerモデルのバリデーション
  with_options presence: true do
    validates :postal_code,   format: { with: /\A\d{3}[-]\d{4}\z/, message: "-ハイフンを入れてください"}
    validates :city_id
    validates :town
    validates :address
    validates :order_id
  end
  validates :building_name,   format: { with: /\A[a-zA-Z0-9]+\z/, message: "-ハイフンなし"}
  validates :city_id, numericality: { other_than: 0 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create( postal_code: postal_code, city_id: city_id, town: town, building_name: building_name,
                  address: address, phone_num: phone_num, order_id: order.id)
  end
end