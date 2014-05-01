class AddAuthorNameToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :author_name, :string
  end
end
