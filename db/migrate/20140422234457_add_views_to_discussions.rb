class AddViewsToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :views, :integer
  end
end
