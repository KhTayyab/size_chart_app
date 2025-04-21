class ProductSizesController < ApplicationController
  
  before_action :set_product_size, only: [:show, :edit, :update, :destroy]

  def index
    # if params[:shop].present?
    #   @product_sizes = ProductSize.where(:shop_name => params[:shop]).order('id ASC')
    # else
    #   redirect_to "https://www.google.com"
    # end
    @product_sizes = ProductSize.where(:shop_name => params[:shop]).order('id ASC')
  end

  def show
  end

  def new
    @product_size = ProductSize.new
  end

  def edit
  end

  def create
    @product_size = ProductSize.new(product_size_params)    
    if @product_size.save
      redirect_to product_sizes_path(:shop => @product_size.shop_name)
    else
      render :new
    end
  end

  def update
    if @product_size.update(product_size_params)
      redirect_to product_sizes_path(:shop => @product_size.shop_name)
    else
      render :edit
    end
  end

  def destroy
    shop_name = @product_size.shop_name
    @product_size.destroy
    redirect_to product_sizes_path(:shop => shop_name)
    @product_size.destroy
  end

  private
    def set_product_size
      @product_size = ProductSize.find(params[:id])
    end

    def product_size_params
      params.require(:product_size).permit(:product_size_name, :shop_name)
    end
end
