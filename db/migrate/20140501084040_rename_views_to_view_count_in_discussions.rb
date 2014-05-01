class RenameViewsToViewCountInDiscussions < ActiveRecord::Migration
  def change
  	rename_column :discussions, :replies, :reply_count
  end
end
