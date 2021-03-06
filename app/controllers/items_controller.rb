class ItemsController < ApplicationController
  before_action :set_item,             only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!,   only: [:new, :edit]

  def index
    @items = Item.all.order("created_at DESC")
    @orders = Order.all
  end

  def new
    @item = Item.new
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
    if Order.exists?(item_id: @item.id)
      redirect_to root_path
      else
      unless current_user.id == @item.user_id
        redirect_to root_path
      end
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
      else
        render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item)
          .permit(
            :item_name, :item_info, :category_id, :status_id, :delivery_fee_id,
            :city_id, :days_to_ship_id, :price, :image
          )
          .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
