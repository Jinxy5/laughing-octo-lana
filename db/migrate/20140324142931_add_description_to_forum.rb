class AddDescriptionToForum < ActiveRecord::Migration
  def change
  
    change_table :forums do |t|
      t.string :description
    end

  end
end
