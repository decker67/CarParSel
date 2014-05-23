class CarsController < ApplicationController

  before_action :set_car, only: [:edit, :update, :destroy]

  def all_models_for_brand
    render json: BrandModel.order( :name ).where( brand_id: params[ :brand_id ] )
  end

  def index
    @view_filter = @view_filter || {}
    @select_filter = @select_filter || {}

    addFilterFor( :brand_model_id, :brand_id  ) { |id| BrandModel.select( :id ).where( brand_id: id ) }
    addFilterFor( :brand_model_id )
    addFilterFor( :car_type )
    addFilterFor( :power )
    addFilterFor( :power, :ps ) { |ps| CarsHelper.ps_to_power( ps.to_i ).round }
    addFilterFor( :year_of_construction )
    addFilterFor( :cylinder_capacity )
    addFilterFor( :fuel )
    addFilterFor( :gearing )
    addFilterFor( :key_number2 )
    addFilterFor( :key_number3 )

    @cars = Car.where( @select_filter ).order( created_at: :desc )
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
      params.require(:car).permit(:car_identifier, :brand_model_id, :car_type, :power, :month_of_construction, :year_of_construction, :month_of_construction_period_from, :year_of_construction_period_from, :month_of_construction_period_to, :year_of_construction_period_to, :cylinder_capacity, :fuel, :gearing, :key_number2, :key_number3, :mileage, :seller_id, :picture_url, :ebay_url_all_parts, :name_ebay_url_all_parts )
    end

    def addFilterFor( name, param_name = name )
      if params[ param_name ].present?
        value = params[ param_name ]
        if block_given?
          modified_value = yield params[ param_name ]
        else
          modified_value = value
        end

        @select_filter[ name ] = modified_value
        @view_filter[ param_name ] = value
      end
    end

end
