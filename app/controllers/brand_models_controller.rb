class BrandModelsController < ApplicationController
  before_action :set_brand_model, only: [:edit, :update, :destroy]

  def index
    if params[ :reset ]
      @filter = {}
    else
      @filter = @filter || {}
      @filter[ :brand_id ] = params[ :brand_id ] if params[ :brand_id ].present?
    end
    @brand_models = BrandModel.where( @filter ).order( :name ).page params[ :page ]
  end

  def new
    @brand_model = BrandModel.new
  end

  def edit
  end

  def create
    @brand_model = BrandModel.new(brand_model_params)

    if @brand_model.save
      redirect_to brand_models_url
    else
      render action: 'new'
    end
  end

  def update
    if @brand_model.update(brand_model_params)
      redirect_to brand_models_url
    else
      render action: 'edit'
    end
  end

  def destroy
    @brand_model.destroy
    redirect_to brand_models_url
  end

  protected
    # def correct_stale_record_version
    #   @destination.reload.attributes = params[:destination].reject do |attrb, value|
    #     attrb.to_sym == :lock_version
    #   end
    # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand_model
      @brand_model = BrandModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brand_model_params
      params.require(:brand_model).permit(:name, :brand_id)
    end
end
