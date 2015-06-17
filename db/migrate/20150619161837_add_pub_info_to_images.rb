class AddPubInfoToImages < ActiveRecord::Migration
  def change
    add_column :images, :pubinfo, :string
  end
end
