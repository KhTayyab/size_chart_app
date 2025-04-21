class HomeController < ShopifyApp::AuthenticatedController
  
  def index
  	if params[:shop].present?
  		shop = params[:shop]
    	redirect_to("https://#{shop}/admin")
    else
			redirect_to("https://www.google.com")
  	end
  end

end
