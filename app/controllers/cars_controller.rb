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
      @equal_filter = {}
      @view_filter = {}
    else
      @view_filter = @view_filter || {}
      @equal_filter = @equal_filter || {}

      addEqualFilterFor( :model_type_id, :brand_id ) do | id |
        BrandModel.select( :id ).where( brand_id: id ).load.map do | brand_model_id |
          ModelType.select( :id ).where( brand_model_id: brand_model_id ).load
        end
      end

      addEqualFilterFor( :model_type_id, :brand_model_id ) { |id| ModelType.select( :id ).where( brand_model_id: id ).load }
      addEqualFilterFor( :model_type_id )
      addEqualFilterFor( :power )
      addEqualFilterFor( :power, :ps ) { |ps| CarsHelper.ps_to_power( ps.to_i ).round }
      addYearFilterFor( :year_of_construction )
      addEqualFilterFor( :cylinder_capacity )
      addEqualFilterFor( :fuel )
      addEqualFilterFor( :gearing )
      addEqualFilterFor( :key_number2 )
      addEqualFilterFor( :key_number3 )
    end

    @cars = Car.where( @equal_filter ).order( created_at: :desc ).page params[ :page ]
    logger.debug 'SQL:' + @cars.to_sql
  end

  def new
    @car = Car.new
    @car.gearing=1
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
    params.require(:car).permit(:engine_code, :color_code, :car_brand_id, :gearing_code,
                                :car_identifier, :model_type_id, :power, :date_of_construction,
                                :cylinder_capacity, :fuel, :gearing, :key_number2, :key_number3,
                                :mileage, :seller_id, :price, :base_image_url, :image_file_name,
                                :ebay_url_all_parts, :name_ebay_url_all_parts, :ebay_shop_category,
                                :ebay_second_shop_category)
  end

end
