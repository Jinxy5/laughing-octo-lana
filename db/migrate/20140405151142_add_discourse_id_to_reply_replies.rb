class AddDiscourseIdToReplyReplies < ActiveRecord::Migration
  def change
  	add_column :reply_replies, :discourse_id, :integer
  end
end
