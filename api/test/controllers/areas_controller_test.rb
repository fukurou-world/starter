require "test_helper"

class AreasControllerTest < ActionDispatch::IntegrationTest
  test "should get register" do
    get areas_register_url
    assert_response :success
  end

  test "should get index" do
    get areas_index_url
    assert_response :success
  end

  test "should get update" do
    get areas_update_url
    assert_response :success
  end

  test "should get delete" do
    get areas_delete_url
    assert_response :success
  end
end
