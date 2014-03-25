class AddTimestampsToUserRole < ActiveRecord::Migration
  def change
  	change_table :user_roles do |t|
  		t.timestamp
  	end
  end
end
