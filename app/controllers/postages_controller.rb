class PostagesController < ApplicationController
  before_action :set_postage, only: [ :edit, :update, :destroy]

  def index
    @postages = Postage.all.page params[:page]
  end

  def new
    @postage = Postage.new
  end

  def edit
  end

  def create
    @postage = Postage.new(postage_params)

    if @postage.save
      redirect_to postages_url
    else
      render action: 'new'
    end
  end

  def update
    if @postage.update(postage_params)
      redirect_to postages_url
    else
      render action: 'edit'
    end
  end

  def destroy
    @postage.destroy
    redirect_to postages_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_postage
    @postage = Postage.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def postage_params
    params.require(:postage).permit(:name, :postage_germany, :postage_austria, :postage_swiss, :postage_europe_with_eu, :postage_europe_without_eu, :postage_world_wide)
  end
end
