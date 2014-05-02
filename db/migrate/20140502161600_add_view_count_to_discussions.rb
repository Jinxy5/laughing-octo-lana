class AddViewCountToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :view_count, :integer
  end
end
