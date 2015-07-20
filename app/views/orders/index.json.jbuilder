json.array!(@orders) do |order|
  json.extract! order, :id, :stripe_id, :email, :address, :city, :state, :zip
  json.url order_url(order, format: :json)
end
