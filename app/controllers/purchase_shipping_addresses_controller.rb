class PurchaseShippingAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: :index

  def index
    @exhibits = Exhibit.find(params[:furima_id])
    @exhibit = Exhibit.new
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def create
    @exhibits = Exhibit.find(params[:furima_id])
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_shipping_address_params)
    if @purchase_shipping_address.valid?
      pay_item
      @purchase_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_shipping_address_params
    params.require(:purchase_shipping_address).permit(:postal_code, :sender_id, :municipalitie, :address, :building_name, :telephone_number).merge(
      token: params[:token], user_id: current_user.id, exhibit_id: params[:furima_id]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @exhibits[:price],
      card: purchase_shipping_address_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @exhibits = Exhibit.find(params[:furima_id])
    if @exhibits.purchase
      redirect_to root_path
    elsif @exhibits.user == current_user
      redirect_to root_path
    end
  end
end
