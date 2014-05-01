class Woowee < ActiveRecord::Migration
  def change
	drop_table :discussions
    create_table :discussions do |t|
    	t.integer :forum_id
    	t.integer :user_id
    	t.string :name
	   	t.string :description
	    t.timestamps
    end
  end
end
