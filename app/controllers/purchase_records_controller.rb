class PurchaseRecordsController < ApplicationController
def index
  @item = Item.find(params[:item_id])
end

def create
  @purchase_record = PurchaseRecord.create!(purchase_record_params)
  Address.create(address_params)
  redirect_to root_path
end

private

def purchase_record_params
  params.permit.merge(user_id: current_user.id, item_id: params[:item_id])
end

def address_params
  params.permit(:post_code, :region_id, :municipality, :block_number, :building, :phone_number).merge(purchase_record_id: @purchase_record.id)
end

end
