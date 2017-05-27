require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_new_url
    assert_response :success
  end

  test "should get edit" do
    get user_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get user_destroy_url
    assert_response :success
  end

end
