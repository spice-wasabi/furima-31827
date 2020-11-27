require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "空欄がなければ登録できる" do
        expect(@user).to be_valid
      end
      it "last_nameは全角ひらがなカタカナ漢字なら登録できる" do
        @user.last_name = "あさひ"
        expect(@user).to be_valid
        @user.last_name = "アサヒ"
        expect(@user).to be_valid
        @user.last_name = "朝日"
        expect(@user).to be_valid
      end
      it "first_nameは全角ひらがなカタカナ漢字なら登録できる" do
        @user.first_name = "たろう"
        expect(@user).to be_valid
        @user.first_name = "タロウ"
        expect(@user).to be_valid
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end
      it "last_name_kanaは全角カタカナなら登録できる" do
        @user.last_name_kana = "アサヒ"
        expect(@user).to be_valid
      end
      it "first_name_kanaは全角カタカナなら登録できる" do
        @user.first_name_kana = "タロウ"
        expect(@user).to be_valid
      end
      it "birthdayは空でなければ登録できる" do
        @user.birthday = "19900101"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailは＠を含まないと登録できない" do
        @user.email = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下では登録できない(数字のみ)" do
        @user.password = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                      "Password is too short (minimum is 6 characters)",
                                                      "Password is invalid")
      end
      it "passwordが5文字以下では登録できない(英数字)" do
        @user.password = "123aB"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                      "Password is too short (minimum is 6 characters)")
      end
      it "passwordが5文字以下では登録できない(英字のみ)" do
        @user.password = "ABcde"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                      "Password is too short (minimum is 6 characters)",
                                                      "Password is invalid")
      end
      it "passwordは数字のみでは登録できない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                      "Password is invalid")
      end
      it "passwordは英字のみでは登録できない" do
        @user.password = "ABCdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                      "Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password = "Abc123"
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end
      it "last_nameが全角ひかがらなカタカナ漢字以外では登録できない" do
        @user.last_name = "abc123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it "first_nameが全角ひかがらなカタカナ漢字以外では登録できない" do
        @user.first_name = "abc123"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank",
                                                      "Last name kana is invalid")
      end
      it "last_name_kanaが全角カタカナでないと登録できない" do
        @user.last_name_kana = "あさひ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "firat_name_kanaが空だと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank",
                                                      "First name kana is invalid")
      end
      it "firat_name_kanaが全角カタカナでないと登録できない" do
        @user.first_name_kana = "あさひ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end

end
