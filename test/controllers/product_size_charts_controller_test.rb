require 'test_helper'

class ProductSizeChartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_size_chart = product_size_charts(:one)
  end

  test "should get index" do
    get product_size_charts_url
    assert_response :success
  end

  test "should get new" do
    get new_product_size_chart_url
    assert_response :success
  end

  test "should create product_size_chart" do
    assert_difference('ProductSizeChart.count') do
      post product_size_charts_url, params: { product_size_chart: { no_of_rows: @product_size_chart.no_of_rows, product_name: @product_size_chart.product_name, product_sizes_ids: @product_size_chart.product_sizes_ids, product_sku: @product_size_chart.product_sku, shop_name: @product_size_chart.shop_name } }
    end

    assert_redirected_to product_size_chart_url(ProductSizeChart.last)
  end

  test "should show product_size_chart" do
    get product_size_chart_url(@product_size_chart)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_size_chart_url(@product_size_chart)
    assert_response :success
  end

  test "should update product_size_chart" do
    patch product_size_chart_url(@product_size_chart), params: { product_size_chart: { no_of_rows: @product_size_chart.no_of_rows, product_name: @product_size_chart.product_name, product_sizes_ids: @product_size_chart.product_sizes_ids, product_sku: @product_size_chart.product_sku, shop_name: @product_size_chart.shop_name } }
    assert_redirected_to product_size_chart_url(@product_size_chart)
  end

  test "should destroy product_size_chart" do
    assert_difference('ProductSizeChart.count', -1) do
      delete product_size_chart_url(@product_size_chart)
    end

    assert_redirected_to product_size_charts_url
  end
end
