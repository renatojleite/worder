class AddCoordinatesToWorkOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :work_orders, :latitude, :float
    add_column :work_orders, :longitude, :float
  end
end
