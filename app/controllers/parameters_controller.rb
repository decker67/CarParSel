class ParametersController < ApplicationController
  before_action :set_parameter, only: [:edit, :update, :destroy]

  def index
    @parameters = Parameter.all.page params[:page]
  end

  def new
    @parameter = Parameter.new
  end

  def edit
  end

  def create
    @parameter = Parameter.new(parameter_params)

      if @parameter.save
        redirect_to parameters_url
      else
        render action: 'new'
      end
  end

  def update
    if @parameter.update(parameter_params)
      redirect_to parameters_url
    else
      render action: 'edit'
    end
  end

  def destroy
    @parameter.destroy
    redirect_to parameters_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parameter
      @parameter = Parameter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parameter_params
      params.require(:parameter).permit(:name, :value, :description)
    end
end
