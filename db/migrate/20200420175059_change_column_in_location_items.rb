class ChangeColumnInLocationItems < ActiveRecord::Migration[5.2]
  def change
  	change_column :location_items, :item_count, :float
  	change_column :location_items, :item_par, :float
  end
end
