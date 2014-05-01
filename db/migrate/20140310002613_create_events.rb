class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :startdate
      t.datetime :enddate
      t.string :title
      t.text :content
      t.string :image_path

      t.timestamps
    end
  end
end
