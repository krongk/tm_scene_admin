json.array!(@sections) do |section|
  json.extract! section, :id, :key, :title, :description, :preview_image, :typo, :is_repeat, :html, :form
  json.url section_url(section, format: :json)
end
