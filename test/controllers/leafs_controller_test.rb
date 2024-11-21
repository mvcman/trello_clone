require "test_helper"

class LeafsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get leafs_new_url
    assert_response :success
  end

  test "should get create" do
    get leafs_create_url
    assert_response :success
  end

  test "should get update" do
    get leafs_update_url
    assert_response :success
  end

  test "should get edit" do
    get leafs_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get leafs_destroy_url
    assert_response :success
  end
end
