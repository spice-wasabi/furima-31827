require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "空欄がなければ登録できる" do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
        it "imageが空だと登録できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it "item_nameが空だと登録できない" do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
        it "item_infoが空だと登録できない" do
          @item.item_info = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item info can't be blank")
        end
        it "category_idが[0]だと登録できない" do
          @item.category_id = "0"
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 0")
        end
        it "status_idが[0]だと登録できない" do
          @item.status_id = "0"
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 0")
        end
        it "delivery_fee_idが[0]だと登録できない" do
          @item.delivery_fee_id = "0"
          # binding.pry
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee must be other than 0")
        end
        it "city_idが[0]だと登録できない" do
          @item.city_id = "0"
          @item.valid?
          expect(@item.errors.full_messages).to include("City must be other than 0")
        end
        it "days_to_ship_idが[0]だと登録できない" do
          @item.days_to_ship_id = "0"
          @item.valid?
          expect(@item.errors.full_messages).to include("Days to ship must be other than 0")
        end
        it "priceが300~9,999,999の間でないと登録できない" do
          @item.price = "200"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
        it "priceが半角数字以外だと登録できない" do
          @item.price = "１０００"
          # binding.pry
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number", "Price is not included in the list")
        end
    end
  end

end
