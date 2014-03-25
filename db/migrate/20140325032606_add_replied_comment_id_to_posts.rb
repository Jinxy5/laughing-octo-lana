class AddRepliedCommentIdToPosts < ActiveRecord::Migration
  def change
	change_table :posts do |t|
		t.integer :replied_post_id
	end
  end
end
