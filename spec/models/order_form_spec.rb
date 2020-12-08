require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it "空欄がなければ登録できる" do
        expect(@order_form).to be_valid
      end
      it "building_nameがなくても登録できる" do
        @order_form.building_name = ""
        @order_form.valid?
        expect(@order_form).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "tokenが空では登録できない" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空では登録できない" do
        @order_form.postal_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank",
                                                            "Postal code is invalid")
      end
      it "postal_codeは「000-0000」3桁ハイフン4桁の半角数字でないと登録できない" do
        @order_form.postal_code = "000５５５５"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end
      it "city_idが空では登録できない" do
        @order_form.city_id = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank", "City is not a number")
      end
      it "city_idは「0」では登録できない" do
        @order_form.city_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City must be other than 0")
      end
      it "townが空では登録できない" do
        @order_form.town = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Town can't be blank")
      end
      it "addressが空では登録できない" do
        @order_form.address = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numが空では登録できない" do
        @order_form.phone_num = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone num can't be blank", "Phone num is invalid")
      end
      it "phone_numが11桁より大きいと登録できない" do
        @order_form.phone_num = "123456789012"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone num is invalid")
      end
      it "phone_numが10桁より小さいと登録できない" do
        @order_form.phone_num = "123456789"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone num is invalid")
      end
      it "phone_numはハイフンなしの半角数字でないと登録できない" do
        @order_form.phone_num = "０９０-３３３３-９９９９"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone num is invalid")
      end
    end
  end

end