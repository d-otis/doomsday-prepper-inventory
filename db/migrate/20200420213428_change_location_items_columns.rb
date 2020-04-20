class ChangeLocationItemsColumns < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :location_items, :item_count, from: nil, to: 0
  	change_column_default :location_items, :item_par, from: nil, to: 0
  end
end
