class ModelTypesController < ApplicationController
  before_action :set_model_type, only: [:show, :edit, :update, :destroy]

  def index
    if params[ :reset ]
      @filter = {}
    else
      @filter = @filter || {}
      @filter[ :brand_model_id ] = params[ :brand_model_id ] if params[ :brand_model_id ].present?
    end
    @model_types = ModelType.where( @filter ).order( :model_type ).page params[ :page ]
  end

  def new
    @model_type = ModelType.new
  end

  def edit
  end

  def create
    @model_type = ModelType.new(model_type_params)

    if @model_type.save
      redirect_to model_types_url
    else
      render action: 'new'
    end
  end

  def update
    if @model_type.update(model_type_params)
      redirect_to model_types_url
    else
      render action: 'edit'
    end
  end

  def destroy
    @model_type.destroy
    redirect_to model_types_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model_type
      @model_type = ModelType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_type_params
      params.require(:model_type).permit(:brand_model_id, :model_type, :month_of_construction_period_from, :year_of_construction_period_from, :month_of_construction_period_to, :year_of_construction_period_to)
    end
end
