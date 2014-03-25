class AddRoleIdToUsersAndRemoveUserIdFromRoles < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.integer :role
  	end

  	remove_column :roles, :user_id
  end
end
