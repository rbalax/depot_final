# test/controllers/orders_controller_test.rb

require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as users(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end
end

# Define login/logout methods for testing authentication
class ActionDispatch::IntegrationTest
  def login_as(user)
    if respond_to?(:visit)
      visit login_url
      fill_in :name, with: user.name
      fill_in :password, with: 'secret'
      click_on 'Login'
    else
      post login_url, params: { name: user.name, password: 'secret' }
    end
  end

  def logout
    delete logout_url
  end
end
