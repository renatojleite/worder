class CreateWorkOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :work_orders do |t|
      t.integer :priority
      t.string :address
      t.datetime :due_date
      t.datetime :due_time
      t.text :description
      t.datetime :completion_date
      t.string :start_photo
      t.string :end_photo
      t.references :team_leader, foreign_key: true
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
