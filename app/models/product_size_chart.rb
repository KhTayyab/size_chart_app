class ProductSizeChart < ApplicationRecord

	####### Array Serializion #########
  serialize :product_sizes_ids, Array
  
	####### Validations #########
  # validates_uniqueness_of :product_name, 	presence: true, uniqueness: { :scope => :shop_name }
  # validates_uniqueness_of :product_sku, 	presence: true, uniqueness: { :scope => :shop_name }

  has_many :product_size_chart_details, dependent: :destroy

end
