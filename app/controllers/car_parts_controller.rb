class CarPartsController < ApplicationController
  before_action :set_car_part, only: [:edit, :update, :destroy]

  def index
    carId = params[ :carId ]
    if carId
      @car_parts = CarPart.where( car_id: carId )
    else
      @car_parts = CarPart.all
    end
  end

  def new
    @car_part = CarPart.new
  end

  def edit
  end

  def create
    @car_part = CarPart.new(car_part_params)

    respond_to do |format|
      if @car_part.save
        format.html { redirect_to car_parts_url }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @car_part.update(car_part_params)
        format.html { redirect_to car_parts_url }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @car_part.destroy
    respond_to do |format|
      format.html { redirect_to car_parts_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_part
      @car_part = CarPart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_part_params
      params.require(:car_part).permit(:car_id, :description, :ebay_article_number, :ebay_selling_type, :ebay_state, :ebay_online_since, :price, :postage_germany, :postage_austria, :postage_swiss, :postage_europe_with_eu, :postage_europe_without_eu, :postage_world_wide, :picture_url1, :picture_url2, :picture_url3, :picture_url4, :picture_url5, :picture_url6, :remark)
    end
end
