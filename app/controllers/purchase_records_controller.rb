class PurchaseRecordsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :sold_out_redirect, only: [:index, :create]

  def index
    @purchase_record_address = PurchaseRecordAddress.new
  end

  def create
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
    params.require(:purchase_record_address).permit(:post_code, :region_id, :municipality, :block_number, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], purchase_record_id: params[:purchase_record_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out_redirect
    redirect_to root_path if @item.user_id == current_user.id || @item.purchase_record.present?
  end
end
