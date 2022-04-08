class PurchaseRecord < ApplicationRecord
  belongs_to :user
  belongs_to :Item
  has_one :Address
end
