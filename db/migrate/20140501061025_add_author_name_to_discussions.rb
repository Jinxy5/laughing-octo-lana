class AddAuthorNameToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :author_name, :string
  end
end
