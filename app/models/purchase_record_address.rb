class PurchaseRecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_id, :municipality, :block_number, :building, :phone_number, :purchase_record_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, allow_blank: true}
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality, :block_number
    validates :phone_number, format: {with: /\A[0-9]{,11}\z/, allow_blank: true}
    validates :user_id, :item_id, :token
  end

  def save
    #購入記録を保存して、変数purchase_recordに代入する
    purchase_record = PurchaseRecord.create(user_id: user_id,item_id: item_id)
    #住所を保存する
    Address.create(post_code: post_code, region_id: region_id, municipality: municipality, block_number: block_number, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end