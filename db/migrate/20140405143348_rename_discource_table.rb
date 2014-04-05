class RenameDiscourceTable < ActiveRecord::Migration
  def change
  	rename_column :discourse_replies, :sub_discourse_id, :reply_id
  end
end
