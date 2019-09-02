class CreateTeamLeaders < ActiveRecord::Migration[5.2]
  def change
    create_table :team_leaders do |t|
      t.string :team_name
      t.references :user, foreign_key: true
      t.references :manager, foreign_key: true

      t.timestamps
    end
  end
end
