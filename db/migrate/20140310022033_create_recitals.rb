class CreateRecitals < ActiveRecord::Migration
  def change
    create_table :recitals do |t|
      t.string :title
      t.text :content
      t.string :image_path

      t.timestamps
    end
  end
end
