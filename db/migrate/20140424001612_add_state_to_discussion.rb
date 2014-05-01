class AddStateToDiscussion < ActiveRecord::Migration
  def change
    add_column :followers, :state, :string
  end
end
