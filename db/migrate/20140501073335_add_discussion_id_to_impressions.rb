class AddDiscussionIdToImpressions < ActiveRecord::Migration
  def change

    add_column :impressions, :discussion_id, :integer
  end
end
