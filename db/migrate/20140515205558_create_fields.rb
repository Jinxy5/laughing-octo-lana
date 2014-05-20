class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.text :content

      t.timestamps
    end
  end
end
