json.array!(@images) do |image|
  json.extract! image, :id, :ark, :bibid, :title, :publisher, :author, :year, :description, :add_date, :upd_date, :copyright
  json.url image_url(image, format: :json)
end
