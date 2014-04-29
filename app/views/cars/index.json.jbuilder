json.array!(@cars) do |car|
  json.extract! car, :id, :carId, :brand, :model, :type, :power, :yearOfConstruction, :integer, :constructionPeriod, :cylinderCapacity, :fuel, :gearing, :keyNumber2, :keyNumber3, :mileage
  json.url car_url(car, format: :json)
end
