json.array!(@keystores) do |keystore|
  json.extract! keystore, :id, :obj_type, :obj_id, :key, :value
  json.url keystore_url(keystore, format: :json)
end
