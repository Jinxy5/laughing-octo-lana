class AddViewsToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :views, :integer
  end
end
