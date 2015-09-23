class StoragesController < ApplicationController
  before_action :set_storage, only: [:edit, :update, :destroy]

  def index
    @storages = Storage.all.order( :name ).page(params[:page]).per(24)

    respond_to do |format|
      format.html
      format.pdf do
        pdf = StorageLabelsPdf.new(@storages)
        send_data pdf.render, filename: 'etiketten.pdf', type: 'application/pdf'
      end
    end
  end

  def new
    @storage = Storage.new
  end

  def edit
  end

  def create
    @storage = Storage.new(storage_params)

    if @storage.save
      redirect_to storages_url
    else
      render action: 'new'
    end
  end

  def update
    if @storage.update(storage_params)
      redirect_to storages_url
    else
      render action: 'edit'
    end
  end

  def destroy
    @storage.destroy
    redirect_to storages_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storage
      @storage = Storage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def storage_params
      params.require(:storage).permit(:name, :description)
    end
end
