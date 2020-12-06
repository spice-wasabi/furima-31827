class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order_form = OrderForm.new 
  end

  def create
    @item = Item.find(params[:item_id])
    # binding.pry
    @order_form = OrderForm.new(order_params)
    if @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  
  private

  def item_params
    params.require(:item).permit( :item_name, :delivery_fee_id, :price, :image)
  end

  def order_params
    item = Item.find(params[:item_id])
    params.permit(:postal_code, :city_id, :town, :building_name,
                  :address, :phone_num, :order_id, :user_id, :item_id).merge(user_id: current_user.id, item_id: item.id)
  end

end
