class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password,        format: { with: /\A(?=.*?[a-zA-Z])(?=.*?[\d])/}, length: { minimum: 6 }
    validates :last_name,       format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :first_name,      format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :last_name_kana,  format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
    validates :first_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  end

  has_many :items
  has_many :orders
  
end
