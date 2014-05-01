class CreateAllowedRoles < ActiveRecord::Migration
  def change
    create_table :allowed_roles do |t|
      t.integer :forum_id
      t.integer :role_id

      t.timestamps
    end
  end
end
