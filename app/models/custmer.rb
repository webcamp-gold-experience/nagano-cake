class Custmer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'に全角文字を使用してください'}
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'に全角文字を使用してください' }
  validates :last_name_kana, format: { with: /[\p{katakana} ー－]+/, message: 'はカタカナで入力して下さい。'}
  validates :first_name_kana, format: { with: /[\p{katakana} ー－]+/, message: 'はカタカナで入力して下さい。',}
  validates :postal_code, format: { with: /\A\d{7}\z/}
  validates :address, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/}

end
