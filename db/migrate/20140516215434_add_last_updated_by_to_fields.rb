class AddLastUpdatedByToFields < ActiveRecord::Migration
  def change
    add_column :fields, :last_updated_by, :string
  end
end
