class AddRepliesToDiscussion < ActiveRecord::Migration
  def change
    add_column :discussions, :replies, :integer
  end
end
