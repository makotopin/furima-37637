class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :region
  belongs_to :delivery_days
  has_one_attached :image
  
  validates :name, :explanation, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to:300, less_than_or_equal_to: 9999999, allow_blank: true, }
  validates :category, :status, :shipping_cost, :region, :delivery_days, numericality: {other_than: 1 , message: "can't be blank"}
  
end