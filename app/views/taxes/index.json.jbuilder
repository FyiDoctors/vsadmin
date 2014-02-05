json.array!(@taxes) do |tax|
  json.extract! tax, :id, :province, :rate, :name
  json.url tax_url(tax, format: :json)
end
