class AddForumIdToDiscourses < ActiveRecord::Migration
  def change
  	add_column :discourses, :forum_id, :integer
  end
end
