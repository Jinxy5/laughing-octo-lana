class AddUserIdToRoles < ActiveRecord::Migration
  def change
  	change_table :roles do |t|
  		t.integer :user_id
  	end

  	add_index :roles, :user_id
  end
end
