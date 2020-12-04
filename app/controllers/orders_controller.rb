class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def cerate
    @buyer = Buyer.new(buyer_params)
  end

  private

  def item_params
    params.require(:item).permit( :item_name, :delivery_fee_id, :price, :image)
  end

  def buyer_params
    params.require(:buyer).permit(:postal_code, :city_id, :town, :building_name,
                                  :address, :phone_num, :purchase_id)
  end

end
