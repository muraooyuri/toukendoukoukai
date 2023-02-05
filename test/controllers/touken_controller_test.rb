require "test_helper"

class ToukenControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get touken_new_url
    assert_response :success
  end

  test "should get index" do
    get touken_index_url
    assert_response :success
  end

  test "should get show" do
    get touken_show_url
    assert_response :success
  end

  test "should get edit" do
    get touken_edit_url
    assert_response :success
  end
end
