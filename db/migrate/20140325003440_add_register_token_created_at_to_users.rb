class AddRegisterTokenCreatedAtToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
		t.datetime :register_token_created_at
  	end
  end
end
