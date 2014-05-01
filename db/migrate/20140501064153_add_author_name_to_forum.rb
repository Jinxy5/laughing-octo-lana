class AddAuthorNameToForum < ActiveRecord::Migration
  def change
    add_column :forums, :author_name, :string
  end
end
