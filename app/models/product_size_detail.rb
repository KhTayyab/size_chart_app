class ProductSizeDetail < ApplicationRecord

	##### Relation #####
	belongs_to 	:product_size
	belongs_to 	:product_size_chart_detail
	
end
