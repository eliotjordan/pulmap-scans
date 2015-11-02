json.array!(@images) do |image|
  json.extract! image, :id, :ark, :bib_id, :title, :publisher, :author, :pub_date, :description, :add_date, :upd_date, :copyright
  json.url image_url(image, format: :json)
end
