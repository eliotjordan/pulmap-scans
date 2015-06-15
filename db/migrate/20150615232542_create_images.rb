class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :ark
      t.integer :bibid
      t.string :title
      t.text :publisher
      t.text :author
      t.integer :year
      t.text :description
      t.datetime :add_date
      t.datetime :upd_date
      t.boolean :copyright

      t.timestamps null: false
    end
    add_index :images, :ark, unique: true
  end
end
