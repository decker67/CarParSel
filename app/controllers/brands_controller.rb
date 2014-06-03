class BrandsController < ApplicationController
  before_action :set_brand, only: [:edit, :update, :destroy]
  rescue_from Exception, with: :handleException

  def index
    @brands = Brand.all.order(:name)
  end

  def new
    @brand = Brand.new
  end

  def edit
  end

  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      redirect_to brands_url
    else
      render action: :new
    end
  end

  def update
    respond_to do |format|
      if @brand.update(brand_params)
        format.html { redirect_to brands_url }
      else
        format.html { render action: :edit }
      end
    end
  end

  def destroy
    @brand.destroy
    respond_to do |format|
      format.html { redirect_to brands_url }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_brand
    @brand = Brand.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def brand_params
    params.require(:brand).permit(:name)
  end

  public
  def handleException(exception)
    flash[:error] = exception.message
    redirect_to brands_url
  end

end
