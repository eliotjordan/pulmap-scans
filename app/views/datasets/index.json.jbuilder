json.array!(@datasets) do |dataset|
  json.extract! dataset, :id, :ark, :bib_id, :title, :publisher, :author, :pub_date, :description, :add_date, :upd_date, :copyright
  json.url image_url(dataset, format: :json)
end
