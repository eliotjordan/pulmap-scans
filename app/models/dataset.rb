class Dataset < ActiveRecord::Base
  self.table_name = 'geodata'
  default_scope { where(item_type: 'dataset') }
end
