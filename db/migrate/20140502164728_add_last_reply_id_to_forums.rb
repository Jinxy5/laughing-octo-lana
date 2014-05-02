class AddLastReplyIdToForums < ActiveRecord::Migration
  def change
    add_column :forums, :last_reply_id, :integer
  end
end
