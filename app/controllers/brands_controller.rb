class BrandsController < ApplicationController
  before_action :set_brand, only: [:edit, :update, :destroy]

  def index
    @brands = Brand.all.order( :name ).page params[ :page ]
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
    if @brand.update(brand_params)
      redirect_to brands_url
    else
      render action: :edit
    end
  end

  def destroy
    @brand.destroy
    redirect_to brands_url
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

end
