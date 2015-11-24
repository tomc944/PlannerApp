class AddColumns < ActiveRecord::Migration
  def change
    add_column :user_comments, :comment_id, :integer
    add_column :goal_comments, :user_id, :integer
    add_index :user_comments, :comment_id
    add_index :goal_comments, :user_id
  end
end
