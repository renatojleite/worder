class AddPhotoToWorkOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :work_orders, :photo, :string
  end
end
