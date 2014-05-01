class AddRememberColumnToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.string :remember_token
  	end

  	add_index :users, :remember_token
  end
end
