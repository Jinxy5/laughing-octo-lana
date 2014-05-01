class Revoke < ActiveRecord::Migration
  def change
  	add_column :users, :revoked_at, :datetime 
  end
end
