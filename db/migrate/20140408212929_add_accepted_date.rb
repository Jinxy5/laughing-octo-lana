class AddAcceptedDate < ActiveRecord::Migration
  def change
  	add_column :users, :accepted_at, :datetime 
  end
end
