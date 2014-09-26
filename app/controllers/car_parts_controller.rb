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

  def index_session_reseted
    session[:car_id] = nil
    redirect_to car_parts_url
  end

  def index
    load_visible_car_parts

    respond_to do |format|
      format.html
      format.pdf do
        pdf = CarPartLabelsPdf.new( @car_parts )
        send_data pdf.render, filename: 'etiketten.pdf', type: 'application/pdf'
      end
    end
  end

  def new
    @car_part = CarPart.new
    @car_part.car_id = session[:car_id]
    @car_part.ebay_state = 1 #bereit für ebay
    @car_part.quantity = 1
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

  def print
    ids = params[ :ids ].split( '_' )
    @car_parts = CarPart.find( ids )
  end

  # --------------------------------------------------------------------------------------------
  # private
  # --------------------------------------------------------------------------------------------
  private

  def load_visible_car_parts
    session[:car_id] = params[:car_id] || session[:car_id]

    if session[:car_id] #show only car parts of the specific car
      @show_filter = false
      if params[:limit]
        @car_parts = CarPart.where(car_id: session[:car_id]).page( params[ :page ] ).per(params[:limit])
      else
        @car_parts = CarPart.where(car_id: session[:car_id]).page( params[ :page ] )
      end
    else
      @show_filter = true
      if params[:reset] #reset filter
        @filter = {}
        @view_filter = {}
      else #show car parts with filter
        @view_filter = @view_filter || {}
        @equal_filter = @equal_filter || {}

        #like = params[:name].concat("%")
        #items = Item.find(:all, :conditions => ["name like ?", like])

        addEqualFilterFor( :car_id, :brand_id ) do | id |
          BrandModel.select( :id ).where( brand_id: id ).load.map do | brand_model_id |
            ModelType.select( :id ).where( brand_model_id: brand_model_id ).load.map do | model_type_id |
              Car.select( :id ).where( model_type_id: model_type_id ).load
            end
          end
        end
        addEqualFilterFor( :car_id, :brand_model_id ) do | id |
          ModelType.select( :id ).where( brand_model_id: id ).load.map do | model_type_id |
            Car.select( :id ).where( model_type_id: model_type_id ).load
          end
        end
        addEqualFilterFor( :car_id, :model_type_id ) { | id | Car.select( :id ).where( model_type_id: model_type_id ).load }
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
      if params[:limit]
        @car_parts = CarPart.where(@equal_filter).order(created_at: :desc).page( params[ :page ] ).per(params[:limit])
      else
        @car_parts = CarPart.where(@equal_filter).order(created_at: :desc).page( params[ :page ] )
      end
    end
  end


  # Use callbacks to share common setup or constraints between actions.
  def set_car_part
    @car_part = CarPart.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def car_part_params
    params.require(:car_part).permit(:car_id, :description, :part_number, :ebay_selling_type, :ebay_state, :ebay_online_since, :price, :postage_germany, :postage_austria, :postage_swiss, :postage_europe_with_eu, :postage_europe_without_eu, :postage_world_wide, :picture_url1, :picture_url2, :picture_url3, :picture_url4, :picture_url5, :picture_url6, :remark)
  end

  def save_and_generate
     !params[ 'save_and_generate' ].nil?
  end

end
