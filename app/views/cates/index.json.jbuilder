json.array!(@cates) do |cate|
  json.extract! cate, :id, :name
  json.url cate_url(cate, format: :json)
end
