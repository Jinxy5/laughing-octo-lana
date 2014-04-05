class CreatepostsSubReplies < ActiveRecord::Migration
  def change
  	create_table :posts_sub_replies do |t|
  		t.integer :post_id
  		t.integer :sub_reply_id
  	end
  end
end
