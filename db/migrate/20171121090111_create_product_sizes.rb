class CreateProductSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :product_sizes do |t|
      t.string :product_size_name
      t.string :shop_name

      t.timestamps
    end
  end
end
