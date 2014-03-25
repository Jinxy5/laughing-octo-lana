class AddViewsToDiscussion < ActiveRecord::Migration
  def change
  	change_table :discussions do |t|
  		t.integer :view
  	end
  end
end
