class CreateProductSizeChartDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :product_size_chart_details do |t|
    	t.integer  :product_size_chart_id
	    t.string   :size_detail_name
      t.timestamps
    end
  end
end
