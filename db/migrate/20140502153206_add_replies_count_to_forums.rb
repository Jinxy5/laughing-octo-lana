class AddRepliesCountToForums < ActiveRecord::Migration
  def change
    add_column :forums, :replies_count, :integer
  end
end
