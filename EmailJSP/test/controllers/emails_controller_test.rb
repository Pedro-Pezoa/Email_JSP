require 'test_helper'

class EmailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get emails_index_url
    assert_response :success
  end

  test "should get inbox" do
    get emails_inbox_url
    assert_response :success
  end

  test "should get profile" do
    get emails_profile_url
    assert_response :success
  end

  test "should get exit" do
    get emails_exit_url
    assert_response :success
  end

end
