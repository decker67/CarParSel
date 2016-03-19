class StoreController < ApplicationController

  layout 'mobile'

  def index
  end

  def search
  end

  def get_storage
    storageId = params[:id]
    storage = nil
    begin
      storage = Storage.find(storageId)
    rescue ActiveRecord::RecordNotFound
    ensure
      render json: {
                 storageName: storage.nil? ? 'unbekannt' : storage.name
             }
    end
  end

  def search_part
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
    storageId = params[:storageId]
    carPartId = params[:partId]
    errorOccured = false

    begin
      storage = Storage.find(storageId)
      storageName = storage.name
      carPart = CarPart.find(carPartId)
      previousStorageId = carPart.storage_id;
      carPartName = carPart.description
      carPart.update(storage_id: storage.id)
    rescue ActiveRecord::RecordNotFound
      errorOccured = true
    ensure
      render json: {
          errorOccured: errorOccured,
          carPartName: carPartName.nil? ? 'unbekannt' : carPartName,
          storageName: storageName.nil? ? 'unbekannt' : storageName,
          previousStorageId: previousStorageId
      }
    end
  end




end
