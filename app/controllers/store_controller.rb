class StoreController < ApplicationController

  layout 'mobile'

  def index
  end

  def store_part
    result = {}
    storageId = params[:storage]
    carPartId = params[:part]
    storage = nil
    car_part = nil
    storageInfo = 'unbekannt'
    carPartInfo = 'unbekannt'

    begin
      storage = Storage.find(storageId)
      storageInfo = storage.name
      car_part = CarPart.find(carPartId)
      carPartInfo = car_part.description
      car_part.update(storage_id: storage.id)
    rescue ActiveRecord::RecordNotFound
    ensure
      render json: {
          car_part: carPartInfo,
          storage: storageInfo
      }
    end
  end

  def search

  end


end
