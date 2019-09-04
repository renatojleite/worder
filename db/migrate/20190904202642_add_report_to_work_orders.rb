class AddReportToWorkOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :work_orders, :report, :text
  end
end
