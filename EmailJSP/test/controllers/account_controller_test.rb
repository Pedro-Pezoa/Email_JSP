require 'test_helper'

class AccountControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get account_new_url
    assert_response :success
  end

end
