class ProductSizeChartDetail < ApplicationRecord

	##### Relation #####
	has_many 		:product_size_details, dependent: :destroy
	belongs_to 	:product_size_chart
	
end
