require "test_helper"

class Admins::ToukensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_toukens_index_url
    assert_response :success
  end
end
