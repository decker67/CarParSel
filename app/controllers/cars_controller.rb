class CarsController < ApplicationController
  before_action :set_car, only: [:edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to cars_path }
      else
        format.html { render action: :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to cars_path }
      else
        format.html { render action: :edit }
      end
    end
  end

  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:car_identifier, :brand_model_id, :car_type, :power, :month_of_construction, :year_of_construction, :month_of_construction_period_from, :year_of_construction_period_from, :month_of_construction_period_to, :year_of_construction_period_to, :cylinder_capacity, :fuel, :gearing, :key_number2, :key_number3, :mileage, :seller_id, :picture_url )
    end
end
