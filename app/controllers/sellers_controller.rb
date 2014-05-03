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

    respond_to do |format|
      if @seller.save
        format.html { redirect_to sellers_url }
      else
        format.html { render action: :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @seller.update(seller_params)
        format.html { redirect_to sellers_url }
      else
        format.html { render action: :edit }
      end
    end
  end

  def destroy
    @seller.destroy
    respond_to do |format|
      format.html { redirect_to sellers_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller
      @seller = Seller.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seller_params
      params.require(:seller).permit(:firstName, :lastName, :street, :city, :phone)
    end
end
