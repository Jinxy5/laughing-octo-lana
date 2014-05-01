class AddDiscussionIdToPost < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.integer :discussion_id
    end
  end
end
