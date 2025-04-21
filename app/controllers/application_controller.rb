class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token 
  #before_filter :current_shop

  private
  helper_method :current_shop

  def current_shop
    @current_shops = Shop.where(:shopify_domain => params[:shop])
    if @current_shops.count == 1
    	@current_shop = @current_shop.first.shopify_domain
    else
    	@current_shop = 'test_shop'
    end
  end

end
