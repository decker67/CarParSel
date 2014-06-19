class SellersController < ApplicationController
  before_action :set_seller, only: [:edit, :update, :destroy]

  def index
    @sellers = Seller.all
  end

  def new
    @seller = Seller.new
  end

  def edit
  end

  def create
    @seller = Seller.new(seller_params)

    if @seller.save
      redirect_to sellers_url
    else
      render action: :new
    end
  end

  def update
    if @seller.update(seller_params)
      redirect_to sellers_url
    else
      render action: :edit
    end
  end

  def destroy
    @seller.destroy
    redirect_to sellers_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller
      @seller = Seller.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seller_params
      params.require(:seller).permit(:first_name, :last_name, :street, :city, :phone)
    end
end

