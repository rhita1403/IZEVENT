class CreateTodolists < ActiveRecord::Migration[7.1]
  def change
    create_table :todolists do |t|
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
