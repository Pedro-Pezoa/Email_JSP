require 'test_helper'

class EmailControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get email_index_url
    assert_response :success
  end

  test "should get inbox" do
    get email_inbox_url
    assert_response :success
  end

  test "should get profile" do
    get email_profile_url
    assert_response :success
  end

end
