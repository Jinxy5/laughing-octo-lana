class AddRegisterKeyToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.string :register_key
  	end

  	remove_column :users, :nick_name
  end
end
