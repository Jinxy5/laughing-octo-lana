class AddPageIdToFields < ActiveRecord::Migration
  def change
    add_column :fields, :page_id, :integer
  end
end
