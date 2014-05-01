class AddDepthToDiscourses < ActiveRecord::Migration
  def change
  	add_column :discourses, :deapth, :integer
  end
end
