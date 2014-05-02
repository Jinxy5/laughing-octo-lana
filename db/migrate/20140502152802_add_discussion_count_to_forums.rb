class AddDiscussionCountToForums < ActiveRecord::Migration
  def change
    add_column :forums, :discussion_count, :integer
  end
end
