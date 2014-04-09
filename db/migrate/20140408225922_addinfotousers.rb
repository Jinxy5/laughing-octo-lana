class Addinfotousers < ActiveRecord::Migration
  def change
  	add_column :users, :public_email, :string
  	add_column :users, :postcode, :string
  	add_column :users, :address, :string
  end
end
