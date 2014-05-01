class AddDeletedToPosts < ActiveRecord::Migration
  def change
	change_table :posts do |t|
		t.boolean :deleted
		t.datetime :delete_date
	end
  end
end
