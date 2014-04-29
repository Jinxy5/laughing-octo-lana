class AddApproveDateToStories < ActiveRecord::Migration
  def change
    add_column :stories, :approve_date, :datetime
  end
end
