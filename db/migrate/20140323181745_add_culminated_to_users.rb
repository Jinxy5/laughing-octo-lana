class AddCulminatedToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.boolean :culminated
  	end
  end
end
