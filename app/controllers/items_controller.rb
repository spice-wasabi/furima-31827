class ItemsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item.id)
      else
        render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :category_id, :status_id, :delivery_fee_id, :city_id,
                  :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end


  
end
