json.array!(@geodata) do |geodatum|
  json.extract! geodatum, :id, :id, :ark, :image_id, :guid, :bib_id, :type, :file_list, :solr_doc_created, :solr_doc_source, :bbox, :bbox_source, :ingest_geoserver, :ingest_solr, :ingest_loris, :copyright, :access, :title, :publisher, :author, :description, :pub_info, :year
  json.url geodatum_url(geodatum, format: :json)
end
