class BrandModelsController < ApplicationController
  before_action :set_brand_model, only: [:edit, :update, :destroy]

  def index
    @brand_models = BrandModel.all
  end

  def new
    @brand_model = BrandModel.new
  end

  def edit
  end

  def create
    @brand_model = BrandModel.new(brand_model_params)

    respond_to do |format|
      if @brand_model.save
        format.html { redirect_to brand_models_url }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @brand_model.update(brand_model_params)
        format.html { redirect_to brand_models_url }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @brand_model.destroy
    respond_to do |format|
      format.html { redirect_to brand_models_url }
    end
  end

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
