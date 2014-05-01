class Reply < ActiveRecord::Migration
  def change
  	create_table :replies do |t|
  		t.integer :user_id
  		t.integer :discussion_id
  		t.boolean :deleted
  		t.string :description
  	end
  end
end
