class AddUserIdToDiscussions < ActiveRecord::Migration
  def change
  	change_table :discussions do |t|
  		t.integer :user_id
  	end

  	add_index :discussions, :user_id
  end
end
