require "test_helper"

class Genres::ToukensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get genres_toukens_index_url
    assert_response :success
  end
end
