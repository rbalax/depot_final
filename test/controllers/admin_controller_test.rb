require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
    get admin_url
    assert_response :success
  end
end
