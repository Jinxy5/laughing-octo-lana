class AddTypes < ActiveRecord::Migration
  def change
  	add_column :discourses, :discourse_type, :string
  	add_column :discourses, :retort_type, :string
  	add_column :discourses, :reply_type, :string
  end
end
