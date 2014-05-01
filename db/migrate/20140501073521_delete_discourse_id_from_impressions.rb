class DeleteDiscourseIdFromImpressions < ActiveRecord::Migration
  def change
    remove_column :impressions, :discourse_id, :integer
  end
end
