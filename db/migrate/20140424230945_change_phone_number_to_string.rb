class ChangePhoneNumberToString < ActiveRecord::Migration
  def change
	change_column :users, :landline, :string
 	change_column :users, :mobile, :string

  end
end
