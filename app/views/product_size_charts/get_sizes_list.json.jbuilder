json.product_size_chart_details Array.new(params[:no_of_rows].to_i).each_index do |index|
	json.size_detail_name ""
	json.product_size_details @product_sizes.each do |product_size|
		json.product_size_chart_details
		json.product_size_id product_size.try(:id)
		json.size_value 0
	end 
end
json.product_size_list @product_sizes.each do |product_size|
	json.id product_size.try(:id)
	json.product_size_name product_size.try(:product_size_name)
end