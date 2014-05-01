class CreateDiscourses < ActiveRecord::Migration
  def change
    create_table :discourses do |t|
      t.integer :user_id
      t.integer :sub_discourse_id
      t.string :title
      t.string :body
      t.boolean :deleted
      t.datetime :delete_date

      t.timestamps
    end
  end
end
