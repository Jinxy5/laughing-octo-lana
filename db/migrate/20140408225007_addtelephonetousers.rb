class Addtelephonetousers < ActiveRecord::Migration
  def change
  	add_column :users, :landline, :integer 
  	add_column :users, :mobile, :integer

  end
end
