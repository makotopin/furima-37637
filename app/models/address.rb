class Address < ApplicationRecord
  belongs_to :purchase_record
  
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, allow_blank: true}
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality, :block_number
    validates :phone_number, format: {with: /\A[0-9]{,11}\z/, allow_blank: true}
  end

end
