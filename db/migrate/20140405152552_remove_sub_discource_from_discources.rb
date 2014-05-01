class RemoveSubDiscourceFromDiscources < ActiveRecord::Migration
  def change
  	remove_column :discourses, :sub_discourse_id 
  end
end
