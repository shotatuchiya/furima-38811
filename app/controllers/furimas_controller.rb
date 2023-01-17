class FurimasController < ApplicationController
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
  end

  private

  def exhibit_params
    params.require(:exhibit).permit(:image, :product_name, :product_description, :category_id, :condition_id,
                                    :shipping_charge_id, :sender_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
