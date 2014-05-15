class AddLastReplyIdToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :last_reply_id, :integer
  end
end
