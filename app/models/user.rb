class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :nickname,          presence: true
  validates :password, format:                          { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :sur_name,          presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]/ }
  validates :name,              presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]/ }
  validates :sur_name_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :name_katakana,     presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day,         presence: true
end
