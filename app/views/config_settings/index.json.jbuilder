json.array!(@config_settings) do |config_setting|
  json.extract! config_setting, :id, :name, :value
  json.url config_setting_url(config_setting, format: :json)
end
