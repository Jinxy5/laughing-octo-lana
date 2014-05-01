class AddFollowerCountToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :follower_count, :integer
  end
end
