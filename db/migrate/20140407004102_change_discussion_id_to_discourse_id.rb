class ChangeDiscussionIdToDiscourseId < ActiveRecord::Migration
  def change
  	rename_column :impressions, :discussion_id, :discourse_id
  end
end
