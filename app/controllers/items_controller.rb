class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]

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
      redirect_to root_path
      else
        render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item.id)
      else
        redirect_to edit_item_path(@item.id)
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :category_id, :status_id, :delivery_fee_id, :city_id,
                  :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end

  
end
