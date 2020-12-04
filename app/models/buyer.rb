class Buyer < ApplicationRecord

  with_options presence: true do
    validates :postal_code,   format: { with: /\A\d{3}[-]\d{4}\z/, message: "-ハイフンを入れてください"}
    validates :city_id
    validates :town
    validates :address        format: { with: /\A[a-zA-Z0-9]+\z/, message: "-ハイフンなし"}
    validates :purchase_id
  end
  validates :building_name

  belongs_to :purchase
end
