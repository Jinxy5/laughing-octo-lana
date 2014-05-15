class AddReplyCountToForums < ActiveRecord::Migration
  def change
    add_column :forums, :reply_count, :integer
  end
end
