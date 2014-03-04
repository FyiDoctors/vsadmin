json.array!(@distributions) do |distribution|
  json.extract! distribution, :id, :email
  json.url distribution_url(distribution, format: :json)
end
