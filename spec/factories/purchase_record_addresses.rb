FactoryBot.define do
  factory :purchase_record_address do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '123-4567' }
    region_id { 2 }
    municipality { '横浜市緑区' }
    block_number { '青山1-1-1' }
    building { '柳ビル103' }
    phone_number { '08012345678' }
  end
end
