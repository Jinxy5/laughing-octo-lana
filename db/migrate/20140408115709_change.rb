class Change < ActiveRecord::Migration
  def change
  	  	change_column :discourses, :type, :string
  end
end
