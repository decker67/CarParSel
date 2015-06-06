# encoding: utf-8

require 'csv'

class CarPartsController < ApplicationController

  before_action :set_car_part, only: [:edit, :update, :destroy]

  def postage_for_postage_id
    id = params[:postage_id]
    render json: Postage.where(id: id )
  end

  def toggle_car_part_state
    id = params[:car_part_id]
    car_part = CarPart.find( id )
    car_part.toggle_state
    #logger.debug( car_part.inspect )
    car_part.save
    render json: { state: car_part.ebay_state,
                   state_as_string: CarPart::AUCTION_STATE[ car_part.ebay_state ][ 0 ] }
  end

  def index_all_parts
    session[:car_id] = nil
    redirect_to car_parts_url
  end

  def index
    load_parts

    respond_to do |format|
      format.html
      format.pdf do
        pdf = CarPartLabelsPdf.new( @car_parts )
        send_data pdf.render, filename: 'etiketten.pdf', type: 'application/pdf'
      end
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"car_parts.csv\""
        headers['Content-Type'] ||= 'text/csv; charset=iso8859-1; header=present'
      end
    end
  end

  def new
    @car_part = CarPart.new
    @car_part.car_id = session[:car_id]
    @car_part.ebay_state = 1 #bereit für ebay
    @car_part.quantity = 1
    @car_part.state = 3000 #gebraucht

    car = @car_part.car
    if !car.nil?
       brand = car.model_type.nil? || car.model_type.brand_model.nil? || car.model_type.brand_model.brand.nil? ? '' : car.model_type.brand_model.brand.name
       model = car.model_type.nil? || car.model_type.brand_model.nil? ? '' : car.model_type.brand_model.name
       type = car.model_type.nil? ? '' : car.model_type.model_type
       @car_part.description = brand + ' ' + model + ' ' + type
    end
  end

  def edit
  end

  def create
    @car_part = CarPart.new(car_part_params)
    if @car_part.save
      if save_and_generate
        @show_generated_ebay_template = true
        render action: 'edit'
      else
        redirect_to car_parts_url
      end
    else
      render action: 'new'
    end
  end

  def update
    if @car_part.update(car_part_params)
      if save_and_generate
        @show_generated_ebay_template = true
        render action: 'edit'
      else
        redirect_to car_parts_url
      end
    else
      render action: 'edit'
    end
  end

  def destroy
    @car_part.destroy
    redirect_to car_parts_url
  end

  # --------------------------------------------------------------------------------------------
  # private
  # --------------------------------------------------------------------------------------------
  private

  def load_parts
    session[:car_id] = params[:car_id] || session[:car_id]
    session[:limit] = params[:limit] || session[:limit]

    if load_parts_of_specific_car
      @show_filter = false
      @car_parts = CarPart.where(car_id: session[:car_id]).page(params[:page])
      if !session[:limit].nil?
        @car_parts = @car_parts.per(session[:limit])
      end
    else
      @show_filter = true
      if params[:reset]
        reset_filter
      else #show car parts with filter
        @view_filter = @view_filter || {}
        @equal_filter = @equal_filter || {}
        @like_filter = @like_filter || {}

        addEqualFilterFor(:id)
        addBrandFilter
        addBrandModelFilter
        addBrandModelTypeFilter
        addEqualFilterFor(:ebay_selling_type)
        addEqualFilterFor(:ebay_state)

        addLikeFilterFor(:description)
        addLikeFilterFor(:part_number)
        addEqualFilterFor(:color_code )
        addEqualFilterFor(:engine_code)
        addEqualFilterFor(:power)
        addEqualFilterFor(:power, :ps) { |ps| CarsHelper.ps_to_power(ps.to_i).round }

        addYearFilterFor(:year_of_construction)

        addEqualFilterFor(:cylinder_capacity)
        addEqualFilterFor(:fuel)
        addEqualFilterFor(:gearing)
        addEqualFilterFor(:key_number2)
        addEqualFilterFor(:key_number3)
      end

      @car_parts = CarPart.where(@equal_filter).order(created_at: :desc).page( params[ :page ] )
      @car_parts = @car_parts.per( session[ :limit ] ) unless session[:limit].nil?

      @like_filter.each do |key, value|
        @car_parts = @car_parts.where("#{key} like ?", value )
      end
    end
  end

  def load_parts_of_specific_car
    !session[:car_id].nil?
  end

  def addBrandModelTypeFilter
    addEqualFilterFor(:car_id, :model_type_id) { |id| Car.select(:id).where(model_type_id: id).load }
  end

  def addBrandModelFilter
    addEqualFilterFor(:car_id, :brand_model_id) do |id|
      ModelType.select(:id).where(brand_model_id: id).load.map do |model_type_id|
        Car.select(:id).where(model_type_id: model_type_id).load
      end
    end
  end

  def addBrandFilter
    addEqualFilterFor(:car_id, :brand_id) do |id|
      BrandModel.select(:id).where(brand_id: id).load.map do |brand_model_id|
        ModelType.select(:id).where(brand_model_id: brand_model_id).load.map do |model_type_id|
          Car.select(:id).where(model_type_id: model_type_id).load
        end
      end
    end
  end

  def reset_filter
    @equal_filter = {}
    @like_filter = {}
    @view_filter = {}
    session[ :id ] = nil
    session[ :description ] = nil
    session[ :part_number ] = nil
    session[ :ebay_selling_type ] = nil
    session[ :ebay_state ] = nil
    session[ :brand_id ] = nil
    session[ :brand_model_id ] = nil
    session[ :model_type_id ] = nil
    session[ :color_code ] = nil
    session[ :engine_code ] = nil
    session[ :power ] = nil
    session[ :ps ] = nil
    session[ :year_of_construction ] = nil
    session[ :cylinder_capacity ] = nil
    session[ :fuel ] = nil
    session[ :gearing ] = nil
    session[ :key_number2 ] = nil
    session[ :key_number3 ] = nil
  end

  def save_and_generate
    !params[ 'save_and_generate' ].nil?
  end

  def set_car_part
    @car_part = CarPart.find(params[:id])
  end

  def car_part_params
    params.require(:car_part).permit(:car_id, :quantity, :stock, :description, :part_number,
                                     :ebay_selling_type, :ebay_state, :ebay_online_since,
                                     :price, :postage_germany, :postage_austria, :postage_swiss,
                                     :postage_europe_with_eu, :postage_europe_without_eu,
                                     :postage_world_wide, :picture_url1, :picture_url2,
                                     :picture_url3, :picture_url4, :picture_url5, :picture_url6,
                                     :remark, :ebay_shop_category, :second_price, :ean,
                                     :show_car_overview, :show_car_details, :state, :postage_id
                                     )
  end

end
