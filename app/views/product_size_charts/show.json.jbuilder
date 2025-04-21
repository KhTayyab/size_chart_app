product_sizes = ProductSize.where(:id => @product_size_chart.product_sizes_ids).order('product_size_name ASC')

if product_sizes.count > 0
	json.product_size_chart do 
		json.id @product_size_chart.try(:id)
		json.product_name @product_size_chart.try(:product_name)
		json.product_sku @product_size_chart.try(:product_sku)
		json.product_sizes_ids @product_size_chart.try(:product_sizes_ids)
		json.no_of_rows @product_size_chart.try(:no_of_rows)
		json.product_size_chart_details @product_size_chart.product_size_chart_details.order('id ASC').each do |product_size_chart_detail|
			json.size_detail_name product_size_chart_detail.size_detail_name
			json.product_size_details product_size_chart_detail.product_size_details.order('id ASC').each do |product_size_detail|
				json.size_value product_size_detail.size_value
				json.product_size_name product_size_detail.product_size.product_size_name
			end
		end
	end

	json.product_size_list product_sizes.each do |product_size|
		json.product_size_name product_size.try(:product_size_name)
	end
else
	json.product_size_chart {}
	json.product_size_list []
end