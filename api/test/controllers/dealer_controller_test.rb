require "test_helper"

class DealerControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get dealer_search_url
    assert_response :success
  end

  test "should get detail" do
    get dealer_detail_url
    assert_response :success
  end

  test "should get update" do
    get dealer_update_url
    assert_response :success
  end

  test "should get delete" do
    get dealer_delete_url
    assert_response :success
  end
end
