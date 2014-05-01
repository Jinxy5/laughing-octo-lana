class RenameDiscouceIdToDiscourseId < ActiveRecord::Migration
  def change
  	rename_column :discourse_replies, :discource_id, :discourse_id
  end
end
