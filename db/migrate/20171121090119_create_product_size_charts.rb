class CreateProductSizeCharts < ActiveRecord::Migration[5.0]
  def change
    create_table :product_size_charts do |t|
      t.string :product_name
      t.string :product_sku
      t.text :product_sizes_ids
      t.float :no_of_rows
      t.string :shop_name

      t.timestamps
    end
  end
end
