class CreateLocationItems < ActiveRecord::Migration[5.2]
  def change
  	create_table :location_items do |t|
  		t.integer :location_id
  		t.integer :item_id
  		t.integer :item_count
  		t.integer :item_par
  		t.boolean :under
  	end
  end
end
