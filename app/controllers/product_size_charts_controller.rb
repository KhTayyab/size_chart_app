class ProductSizeChartsController < ApplicationController
  
  before_action :set_product_size_chart, only: [:show, :edit, :update, :destroy]

  def index
    # if params[:shop].present?
    #   @product_size_charts = ProductSizeChart.where(:shop_name => params[:shop]).order('id ASC')
    # else
    #   redirect_to "https://www.google.com"
    # end
    @product_size_charts = ProductSizeChart.where(:shop_name => params[:shop]).order('id ASC')
  end

  def show
  end

  def new
    @product_sizes = ProductSize.where(:shop_name => params[:shop]).order('id ASC')
    # @product_sizes = ProductSize.all.order('id ASC')
    @product_size_chart = ProductSizeChart.new
    @product_size_chart.no_of_rows = 0
  end

  def edit
    @product_sizes = ProductSize.where(:shop_name => params[:shop]).order('id ASC')
  end

  def create
    @product_size_chart = ProductSizeChart.new(product_size_chart_params)
    @product_size_chart.product_sizes_ids = params[:product_sizes_ids].map(&:to_i)
    if @product_size_chart.save
      if params[:product_size_chart][:product_size_chart_details].present?
        product_size_chart_details = params[:product_size_chart][:product_size_chart_details]
        if product_size_chart_details.count > 0
          Array.new(product_size_chart_details.count).each_index do |index|
            product_size_chart_detail = @product_size_chart.product_size_chart_details.build
            product_size_chart_detail.size_detail_name = product_size_chart_details[index.to_s][:size_detail_name]
            product_size_chart_detail.save
            if product_size_chart_details[index.to_s][:product_size_details].present?
              product_size_details = product_size_chart_details[index.to_s][:product_size_details]
              if product_size_details.count > 0
                Array.new(product_size_details.count).each_index do |nested_index|
                  add_detail = product_size_chart_detail.product_size_details.build
                  add_detail.size_value = product_size_details[nested_index.to_s][:size_value]
                  add_detail.product_size_id = product_size_details[nested_index.to_s][:product_size_id]
                  add_detail.save
                end
              end
            end
          end
        end
      end
      redirect_to product_size_charts_path(:shop => @product_size_chart.shop_name)
    else
      redirect_to :back
    end
  end

  def update
    @product_size_chart.product_sizes_ids = params[:product_sizes_ids].map(&:to_i)
    if @product_size_chart.update(product_size_chart_params)
      if params[:product_size_chart][:product_size_chart_details].present?
        product_size_chart_details = params[:product_size_chart][:product_size_chart_details]
        if product_size_chart_details.count > 0
          Array.new(product_size_chart_details.count).each_index do |index|
            if @product_size_chart.product_size_chart_details.exists?(size_detail_name:product_size_chart_details[index.to_s][:size_detail_name])
              product_size_chart_detail = @product_size_chart.product_size_chart_details.find_by(size_detail_name:product_size_chart_details[index.to_s][:size_detail_name])
              # product_size_chart_detail.size_detail_name = product_size_chart_details[index.to_s][:size_detail_name]
              # product_size_chart_detail.save
              if product_size_chart_details[index.to_s][:product_size_details].present?
                product_size_details = product_size_chart_details[index.to_s][:product_size_details]
                if product_size_details.count > 0
                  Array.new(product_size_details.count).each_index do |nested_index|
                    if product_size_chart_detail.product_size_details.exists?(product_size_id:product_size_details[nested_index.to_s][:product_size_id])
                      add_detail = product_size_chart_detail.product_size_details.find_by(product_size_id:product_size_details[nested_index.to_s][:product_size_id])
                      add_detail.size_value = product_size_details[nested_index.to_s][:size_value]
                      # add_detail.product_size_id = product_size_details[nested_index.to_s][:product_size_id]
                      add_detail.save
                    else
                      add_detail = product_size_chart_detail.product_size_details.build
                      add_detail.size_value = product_size_details[nested_index.to_s][:size_value]
                      add_detail.product_size_id = product_size_details[nested_index.to_s][:product_size_id]
                      add_detail.save
                    end
                  end
                end
              end
            else
              product_size_chart_detail = @product_size_chart.product_size_chart_details.build
              product_size_chart_detail.size_detail_name = product_size_chart_details[index.to_s][:size_detail_name]
              product_size_chart_detail.save
              if product_size_chart_details[index.to_s][:product_size_details].present?
                product_size_details = product_size_chart_details[index.to_s][:product_size_details]
                if product_size_details.count > 0
                  Array.new(product_size_details.count).each_index do |nested_index|
                    add_detail = product_size_chart_detail.product_size_details.build
                    add_detail.size_value = product_size_details[nested_index.to_s][:size_value]
                    add_detail.product_size_id = product_size_details[nested_index.to_s][:product_size_id]
                    add_detail.save
                  end
                end
              end
            end
          end
        end
      end
      redirect_to product_size_charts_path(:shop => @product_size_chart.shop_name)
    else
      redirect_to :back
    end
  end

  def find_by_sku
    @product_size_chart = ProductSizeChart.find_by(:product_sku => params[:product_sku], :shop_name => params[:shop_name])
    if @product_size_chart.nil?
      render status:404, json: {message: "Record Not Found"}
    else  
      render status:200, template: 'product_size_charts/show.json.jbuilder'
    end
  end

  def find_by_name
    @product_size_chart = ProductSizeChart.find_by(:product_name => params[:product_name], :shop_name => params[:shop_name])
    if @product_size_chart.nil?
      render status:404, json: {message: "Record Not Found"}
    else  
      render status:200, template: 'product_size_charts/show.json.jbuilder'
    end
  end

  def destroy
    shop_name = @product_size_chart.shop_name
    @product_size_chart.destroy
    redirect_to product_size_charts_path(:shop => shop_name)
  end

  def get_sizes_list
    if not params[:product_sizes_ids].blank?
      @product_sizes_ids = params[:product_sizes_ids].map(&:to_i)
      @product_sizes = ProductSize.where(:id => @product_sizes_ids).order('id ASC')
    else
      @product_sizes_ids = []
      @product_sizes = []
    end
    render status:200, template: 'product_size_charts/get_sizes_list.json.jbuilder'
  end

  def get_sizes_list_for_edit
    if params[:id].present?
      @product_size_chart = ProductSizeChart.find(params[:id])
    end
    if not params[:product_sizes_ids].blank?
      @product_sizes_ids = params[:product_sizes_ids].map(&:to_i)
      @product_sizes = ProductSize.where(:id => @product_sizes_ids).order('id ASC')
    else
      @product_sizes_ids = []
      @product_sizes = []
    end
    render status:200, template: 'product_size_charts/get_sizes_list_for_edit.json.jbuilder'
  end

  private
    def set_product_size_chart
      @product_size_chart = ProductSizeChart.find(params[:id])
    end

    def product_size_chart_params
      params.require(:product_size_chart).permit(:product_name, :product_sku, :no_of_rows, :shop_name)
    end
end
