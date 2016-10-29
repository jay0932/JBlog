class AddComments < ActiveRecord::Migration[5.0]
  def change
	create_table :comments do |to|
		t.string :content
                t.integer :post_id
                t.integer :user_id

                t.timestamps null: false
	end 
  end
end
