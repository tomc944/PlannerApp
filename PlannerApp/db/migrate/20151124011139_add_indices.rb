class AddIndices < ActiveRecord::Migration
  def change
    add_index :users, :username
    add_index :users, :session_token
    add_index :goals, :user_id
    rename_column :goals, :private, :private
  end
end
