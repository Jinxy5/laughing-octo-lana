class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :name
      t.integer :forum_id

      t.timestamps
    end
  end
end
