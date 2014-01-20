json.array!(@fees) do |fee|
  json.extract! fee, :id, :from, :to, :fee, :model_id
  json.url fee_url(fee, format: :json)
end
