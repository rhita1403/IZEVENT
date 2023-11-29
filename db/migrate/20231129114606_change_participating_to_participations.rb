class ChangeParticipatingToParticipations < ActiveRecord::Migration[7.1]
  def change
    change_column :participations, :participating, :boolean, default: nil
  end
end
