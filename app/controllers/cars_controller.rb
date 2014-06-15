class CarsController < ApplicationController

  before_action :set_car, only: [:edit, :update, :destroy]

  def all_models_for_brand
    id = params[:brand_id]
    render json: id != '' ? BrandModel.order(:name).where(brand_id: id ) : BrandModel.order(:name)
  end

  def all_types_for_model
    id = params[:brand_model_id]
    render json: id != '' ? ModelType.order(:model_type).where(brand_model_id: id ) : ModelType.order(:model_type)
  end

  def index
    if params[:reset]
      @filter = {}
      @view_filter = {}
    else
      @view_filter = @view_filter || {}
      @select_filter = @select_filter || {}

      #addFilterFor(:brand_model_id, :brand_id) { |id| BrandModel.select(:id).where(brand_id: id) }
      #addFilterFor(:brand_model_id, :brand_id) { |id| ModelType.select(:id).where(model_type_id: id) }
      addFilterFor(:model_type_id)
      addFilterFor(:car_type)
      addFilterFor(:power)
      addFilterFor(:power, :ps) { |ps| CarsHelper.ps_to_power(ps.to_i).round }
      addFilterFor(:year_of_construction)
      addFilterFor(:cylinder_capacity)
      addFilterFor(:fuel)
      addFilterFor(:gearing)
      addFilterFor(:key_number2)
      addFilterFor(:key_number3)
    end
    @cars = Car.where(@select_filter).order(created_at: :desc)
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to cars_path
    else
      render action: :new
    end
  end

  def update
    if @car.update(car_params)
      redirect_to cars_path
    else
      render action: :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def car_params
    params.require(:car).permit(:engine_code, :color_code, :car_brand_id, :gearing_code, :car_identifier, :model_type_id, :power, :date_of_construction, :cylinder_capacity, :fuel, :gearing, :key_number2, :key_number3, :mileage, :seller_id, :price, :picture_url, :ebay_url_all_parts, :name_ebay_url_all_parts)
  end

  def addFilterFor(name, param_name = name)
    if params[param_name].present?
      value = params[param_name]
      if block_given?
        modified_value = yield params[param_name]
      else
        modified_value = value
      end

      @select_filter[name] = modified_value
      @view_filter[param_name] = value
    end
  end

end
