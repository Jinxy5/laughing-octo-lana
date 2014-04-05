class AddFirstNameLastNameNearestTownToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |c|
  		c.string :first_name
  		c.string :last_name
  		c.string :nearest_town
  	end
  end
end
