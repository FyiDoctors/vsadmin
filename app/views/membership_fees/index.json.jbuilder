json.array!(@memberhip_fees) do |fee|
  json.extract! fee, :id, :month, :year
  json.url clinic_url(fee, format: :json)
end
