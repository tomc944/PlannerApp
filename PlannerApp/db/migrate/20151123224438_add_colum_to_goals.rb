class AddColumToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :completion_status, :boolean, default: false, null: false
  end
end
