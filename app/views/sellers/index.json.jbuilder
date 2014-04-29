json.array!(@sellers) do |seller|
  json.extract! seller, :id, :firstName, :lastName, :street, :city, :phone
  json.url seller_url(seller, format: :json)
end
