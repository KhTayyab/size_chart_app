json.product_size_chart_details @product_size_chart.product_size_chart_details.each do |product_size_chart_detail|
	json.size_detail_name product_size_chart_detail.size_detail_name
	json.product_size_details product_size_chart_detail.product_size_details.each do |product_size_detail|
		json.product_size_chart_detail_id product_size_detail.try(:product_size_chart_detail_id)
		json.product_size_id product_size_detail.try(:product_size_id)
		json.size_value product_size_detail.try(:size_value)
	end 
end

json.product_size_list @product_size_chart.product_size_chart_details.last.product_size_details.each do |product_size_detail|
	# json.id product_size.try(:id)
	# binding.pry
	json.product_size_name product_size_detail.product_size.try(:product_size_name)
end