require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get guide" do
    get static_pages_guide_url
    assert_response :success
  end

  test "should get shipping" do
    get static_pages_shipping_url
    assert_response :success
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end

  test "should get service" do
    get static_pages_service_url
    assert_response :success
  end

end
