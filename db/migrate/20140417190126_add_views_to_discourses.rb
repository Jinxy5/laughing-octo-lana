class AddViewsToDiscourses < ActiveRecord::Migration
  def change
	add_column :discourses, :views, :integer
  end
end
