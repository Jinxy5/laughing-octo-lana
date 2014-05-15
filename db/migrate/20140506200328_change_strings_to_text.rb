class ChangeStringsToText < ActiveRecord::Migration
  def change
  	change_column :stories, :description, :text
  	change_column :discussions, :description, :text
  	change_column :replies, :description, :text
  end
end
