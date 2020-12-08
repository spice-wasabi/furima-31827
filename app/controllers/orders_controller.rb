class OrdersController < ApplicationController
  before_action :item_params,          only: [:index, :create]
  before_action :authenticate_user!,   only: [:index]

  def index
    @order_form = OrderForm.new 
    if current_user.id == @item.user_id || Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

  def new
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  
  private

  def item_params
    @item = Item.find(params[:item_id])
  end

  def order_form_params
    params.require(:order_form)
          .permit(
            :postal_code, :city_id, :town, :building_name, :address, :phone_num, :token
          ).merge(
            user_id: current_user.id, item_id: @item.id, token: params[:token]
          )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: item_params[:price],
      card: order_form_params[:token],
      currency: 'jpy'
    )
  end

end
