class PurchaseRecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_record_address = PurchaseRecordAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_record_address = PurchaseRecordAddress.new(purchase_record_params)
    if @purchase_record_address.valid?
      pay_item
      @purchase_record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record_address).permit(:post_code, :region_id, :municipality, :block_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], purchase_record_id: params[:purchase_record_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_41b0d69a582d7655e3a7ebb7"
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end
end
