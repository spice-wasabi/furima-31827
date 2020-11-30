class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
      else
        render :new
    end
    
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :category_id, :status_id, :delivery_fee_id, :city_id,
                  :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end


  
end
