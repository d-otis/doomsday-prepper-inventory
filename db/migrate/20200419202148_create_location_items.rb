class CreateLocationItems < ActiveRecord::Migration[5.2]
  def change
  	create_table :location_items do |t|
  		t.integer :location_id
  		t.integer :item_id
  		t.float :item_count, :default => 0
  		t.float :item_par, :default => 0
  		t.boolean :under
  		t.timestamps
  	end
  end
end
