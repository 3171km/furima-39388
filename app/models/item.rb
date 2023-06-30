class Item < ApplicationRecord
  
  belongs_to :user
  has_one    :buyer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :region
  belongs_to :shipment

  validates :title,    presence: true
  validates :overview, presence: true
  validates :image,    presence: true
  validates :category_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id,    numericality: { other_than: 1 , message: "can't be blank"}
  validates :burden_id,    numericality: { other_than: 1 , message: "can't be blank"}
  validates :region_id ,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipment_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,        numericality: { greater_than: 299, less_than: 10_000_000, only_integer: true }
end
