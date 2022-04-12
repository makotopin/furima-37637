require 'rails_helper'

RSpec.describe PurchaseRecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_record_address = FactoryBot.build(:purchase_record_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  context '商品が購入できる場合' do
    it "すべての項目が正しく入力されている" do
      expect(@purchase_record_address).to be_valid
    end
    it "building(任意)が空で、その他の項目が正しく入力されている" do
      @purchase_record_address.building = ''
      expect(@purchase_record_address).to be_valid
    end
  end

  context '商品が購入できない場合' do
    it "tokenが空では購入できない" do
      @purchase_record_address.token = nil
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Token can't be blank")
    end
    it "郵便番号が空では購入できない" do
      @purchase_record_address.post_code = ''
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Post code can't be blank")
    end
    it "郵便番号が（３桁-４桁）でないと購入できない" do
      @purchase_record_address.post_code = '00000000'
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Post code is invalid")
    end
    it "region_idが1だと購入できない" do
      @purchase_record_address.region_id = 1
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Region can't be blank")
    end
    it "municipalityが空だと購入できない" do
      @purchase_record_address.municipality = ''
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it "block_numberが空だと購入できない" do
      @purchase_record_address.block_number = ''
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Block number can't be blank")
    end
    it "phone_numberが空では購入できない" do
      @purchase_record_address.phone_number = ''
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it "phone_numberが9桁以下では購入できない" do
      @purchase_record_address.phone_number = '000000000'
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Phone number is invalid")
    end
    it "phone_numberが12桁以上では購入できない" do
      @purchase_record_address.phone_number = '000000000000'
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Phone number is invalid")
    end
    it "phone_numberが半角数字以外では購入できない" do
      @purchase_record_address.phone_number = '000-0000-0000'
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Phone number is invalid")
    end
    it "ユーザー情報が紐づいていないと購入できない" do
      @purchase_record_address.user_id = nil
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("User can't be blank")
    end
    it "商品情報が紐づいていないと購入できない" do
      @purchase_record_address.item_id = nil
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Item can't be blank")
    end
  end

end
