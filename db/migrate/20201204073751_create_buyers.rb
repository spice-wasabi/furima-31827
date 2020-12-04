class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|

      t.string    :postal_code,           null: false
      t.integer   :city_id,               null: false
      t.string    :town,                  null: false
      t.string    :building_name
      t.string    :address,               null: false
      t.string    :phone_num,             null: false
      t.integer   :purchase_id,           null: false, foreign_key: true

      t.timestamps
    end
  end
end
