require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  test "should get register" do
    get skills_register_url
    assert_response :success
  end

  test "should get index" do
    get skills_index_url
    assert_response :success
  end

  test "should get update" do
    get skills_update_url
    assert_response :success
  end

  test "should get delete" do
    get skills_delete_url
    assert_response :success
  end
end
