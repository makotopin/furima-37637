class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :region
  belongs_to :delivery_days

  validates :name, :explanation, :price, presence: true
  validates :category, :status, :shipping_cost, :region, :delivery_days, numericality: {other_than: 1 , message: "can't be blank"}

end