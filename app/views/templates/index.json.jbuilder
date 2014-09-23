json.array!(@templates) do |template|
  json.extract! template, :id, :cate_id, :title, :price, :init_section_keys, :html, :form
  json.url template_url(template, format: :json)
end
