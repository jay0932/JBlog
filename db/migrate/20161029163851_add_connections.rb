class AddConnections < ActiveRecord::Migration[5.0]
  def change
	create_table :connections do |t|
		t.integer :post_id
                t.integer :category_id

                t.timestamps null: false
	end
  end
end
