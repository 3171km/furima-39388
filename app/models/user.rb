class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :sur_name, presence: true
         validates :name, presence: true
         validates :sur_name_katakana, presence: true
         validates :name_katakana, presence: true
         validates :birth_day, presence: true
end
