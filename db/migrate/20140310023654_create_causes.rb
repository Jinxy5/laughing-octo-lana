class CreateCauses < ActiveRecord::Migration
  def change
    create_table :causes do |t|
      t.string :title
      t.text :content
      t.string :image_path
      t.integer :amount_requested
      t.integer :amount_donated

      t.timestamps
    end
  end
end
