class AddNameToFields < ActiveRecord::Migration
  def change
    add_column :fields, :name, :text
  end
end
