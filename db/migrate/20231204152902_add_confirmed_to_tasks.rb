class AddConfirmedToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :confirmed, :boolean, default: false
  end
end
