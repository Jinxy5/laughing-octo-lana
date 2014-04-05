class CreateReplyReplies < ActiveRecord::Migration
  def change
    create_table :reply_replies do |t|
      t.integer :reply_id
      t.integer :retort_id

      t.timestamps
    end
  end
end
