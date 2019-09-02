class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :category_name
      t.references :work_order, foreign_key: true

      t.timestamps
    end
  end
end
