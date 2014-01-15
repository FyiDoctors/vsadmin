json.array!(@securities) do |security|
  json.extract! security, :id, :secret
  json.url security_url(security, format: :json)
end
