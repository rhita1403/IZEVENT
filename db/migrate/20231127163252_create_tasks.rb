class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.text :description
      t.float :cost
      t.references :user, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
