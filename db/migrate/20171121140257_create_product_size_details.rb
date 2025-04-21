class CreateProductSizeDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :product_size_details do |t|
    	t.integer  :product_size_id
    	t.integer  :product_size_chart_detail_id
    	t.float    :size_value,                   default: 0.0
      t.timestamps
    end
  end
end
