class AddDefaultToCopyright < ActiveRecord::Migration
  def change
    change_column :images, :copyright, :boolean, default: true
  end
end
