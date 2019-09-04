class ChangeStatus < ActiveRecord::Migration[5.2]
  def change
    remove_column :work_orders, :status_id
    add_column :work_orders, :status, :integer
    drop_table :statuses
  end
end
