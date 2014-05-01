class Addtypetodiscourcestable < ActiveRecord::Migration
  def change
  	add_column :discourses, :type, :integer
  end
end
