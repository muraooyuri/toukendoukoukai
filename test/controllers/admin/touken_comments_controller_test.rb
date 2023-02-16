require "test_helper"

class Admin::ToukenCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_touken_comments_index_url
    assert_response :success
  end
end
