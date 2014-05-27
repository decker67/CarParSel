class CarPartsController < ApplicationController
  before_action :set_car_part, only: [:edit, :update, :destroy]

  def index_session_reseted
    session[:car_id] = nil
    redirect_to car_parts_url
  end

  def index
    session[:car_id] = params[:car_id] || session[:car_id]
    if session[:car_id]
      @show_filter = false
      @car_parts = CarPart.where(car_id: session[:car_id])
    else
      @show_filter = true
      @view_filter = @view_filter || {}
      @select_filter = @select_filter || {}

      addFilterFor(:description)
      addFilterFor(:ebay_article_number)
      addFilterFor(:ebay_selling_type)
      # addFilterFor(:brand_model_id, :brand_id) { |id| BrandModel.select(:id).where(brand_id: id) }
      # addFilterFor(:brand_model_id)
      # addFilterFor(:car_type)
      # addFilterFor(:power)
      # addFilterFor(:power, :ps) { |ps| CarsHelper.ps_to_power(ps.to_i).round }
      # addFilterFor(:year_of_construction)
      # addFilterFor(:cylinder_capacity)
      # addFilterFor(:fuel)
      # addFilterFor(:gearing)
      # addFilterFor(:key_number2)
      # addFilterFor(:key_number3)

      @car_parts = CarPart.where(@select_filter).order(created_at: :desc)
    end
  end

  def new
    @car_part = CarPart.new
    @car_part.car_id = session[:car_id]
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
