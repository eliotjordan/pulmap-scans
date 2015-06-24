class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :ark
      t.integer :bibid
      t.string :title
      t.text :publisher
      t.text :author
      t.text :description
      t.text :pub_info
      t.integer :year
      t.text :bbox_source
      t.text :bbox
      t.text :ingested
      t.text :georefed
      t.text :image_status
      t.boolean :copyright

      t.timestamps null: false
    end
    add_index :images, :ark, unique: true
  end
end
