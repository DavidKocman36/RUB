require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "get index" do
    get root_path
    assert_response :success
  end
end
