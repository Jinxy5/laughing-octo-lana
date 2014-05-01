class AddDudHardDeletedAtSoftDeletedAtToUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.boolean :dud
  		t.datetime :hard_deleted_at
  		t.datetime :soft_deleted_at
  	end
  end
end
