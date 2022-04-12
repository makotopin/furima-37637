class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post_code,       null: false
      t.integer    :region_id ,      null: false
      t.string     :municipality,    null: false
      t.string     :block_number,    null: false
      t.string     :building
      t.string     :phone_number,    null: false
      t.references :purchase_record, null: false, foreign_key: true
      t.timestamps
    end
  end
end
