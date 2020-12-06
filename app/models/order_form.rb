class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :city_id, :town, :building_name, :address, :phone_num,
                :order_id, :user_id, :item_id, :token

# buyerモデルのバリデーション
  with_options presence: true do
    validates :postal_code,   format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city_id, numericality: { other_than: 0 }
    validates :address
    validates :phone_num, format: { with: /\A[0-9]+\z/ }
    validates :order_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id, token: token)
    Buyer.create( postal_code: postal_code, city_id: city_id, town: town, building_name: building_name,
                  address: address, phone_num: phone_num, order_id: order.id)
  end
end