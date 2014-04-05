class CreateDiscourseReplies < ActiveRecord::Migration
  def change
    create_table :discourse_replies do |t|
      t.integer :discource_id
      t.integer :reply_id

      t.timestamps
    end
  end
end
