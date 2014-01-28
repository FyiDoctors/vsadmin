json.array!(@clinics) do |clinic|
  json.extract! clinic, :id, :name, :doctor, :address, :vsid, :model_id, :admin
  json.url clinic_url(clinic, format: :json)
end
