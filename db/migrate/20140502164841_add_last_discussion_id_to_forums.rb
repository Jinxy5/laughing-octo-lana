class AddLastDiscussionIdToForums < ActiveRecord::Migration
  def change
    add_column :forums, :last_discussion_id, :integer
  end
end
