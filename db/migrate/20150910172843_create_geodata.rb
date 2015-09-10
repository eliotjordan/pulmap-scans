class CreateGeodata < ActiveRecord::Migration
  def change
    create_table :geodata do |t|
      t.text :ark
      t.integer :image_id
      t.text :guid
      t.integer :bib_id
      t.text :item_type
      t.text :file_list
      t.boolean :solr_doc_created, default: false
      t.text :solr_doc_source
      t.text :bbox
      t.text :bbox_source
      t.boolean :ingest_geoserver, default: false
      t.boolean :ingest_solr, default: false
      t.boolean :ingest_loris, default: false
      t.boolean :copyright, default: true
      t.text :access, default: 'campus'
      t.text :title
      t.text :publisher
      t.text :author
      t.text :description
      t.text :pub_info
      t.date :year

      t.timestamps null: false
    end
    add_index :geodata, :ark, unique: true
  end
end
