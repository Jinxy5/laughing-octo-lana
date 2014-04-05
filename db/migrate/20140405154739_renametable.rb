class Renametable < ActiveRecord::Migration
  def change
  	rename_table :reply_replies, :reply_retorts
  end
end
