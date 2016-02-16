class StoreController < ApplicationController

  layout 'mobile'

  def index
  end

  def search
  end

  def search_part
    result = {}
    partId = params[:partId]
    car_part = nil
    storage = nil
    begin
      car_part = CarPart.find(partId)
      storage = Storage.find(car_part.storage_id)
    rescue ActiveRecord::RecordNotFound
    ensure
      render json: {
                 car_part: car_part.description,
                 storage: storage.nil? ? 'unbekannt' : storage.name
             }
    end
  end

  def store_part_found
    partFound = params[:found]
    carPartId = params[:carPartId]
    car_part = CarPart.find(carPartId)
    if partFound != 'false'
      car_part.update(ebay_state: 4) #verkauft
    else
      car_part.update(state: 8000) #fehlt
    end
    render json: {

           }
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
      previous_storage = car_part.storage_id;
      carPartInfo = car_part.description
      car_part.update(storage_id: storage.id)
    rescue ActiveRecord::RecordNotFound
    ensure
      render json: {
          car_part: carPartInfo,
          storage: storageInfo,
          previous_storage: previous_storage }
    end
  end




end
