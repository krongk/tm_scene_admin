json.array!(@resources) do |resource|
  json.extract! resource, :id, :typo, :name
  json.url resource_url(resource, format: :json)
end
