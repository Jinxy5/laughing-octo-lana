class CreateImpressions < ActiveRecord::Migration
  def change
    create_table :impressions do |t|
      t.string :ip_address
      t.integer :discussion_id
      t.integer :user_id

      t.timestamps
    end
  end
end
