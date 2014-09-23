json.array!(@page_templates) do |page_template|
  json.extract! page_template, :id, :title, :preview_image, :html
  json.url page_template_url(page_template, format: :json)
end
