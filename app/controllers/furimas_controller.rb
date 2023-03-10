class FurimasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_exhibit, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :move_to_edit, only: [:edit, :update, :destroy]
  def index
    @exhibits = Exhibit.order('created_at DESC')
  end

  def new
    @exhibit = Exhibit.new
  end

  def create
    @exhibit = Exhibit.new(exhibit_params)
    if @exhibit.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def edit
  end

  def destroy
    @exhibit.destroy
    redirect_to root_path
  end

  def update
    if @exhibit.update(exhibit_params)
      redirect_to furima_path
    else
      render :edit
    end
  end

  private

  def exhibit_params
    params.require(:exhibit).permit(:image, :product_name, :product_description, :category_id, :condition_id,
                                    :shipping_charge_id, :sender_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_exhibit
    @exhibit = Exhibit.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @exhibit.user_id
    redirect_to root_path
    end
  end

  def move_to_edit
    if @exhibit.purchase
    redirect_to root_path
    end
  end
end
