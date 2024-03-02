require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home/get started" do
    get get_started_url
    assert_response :success
  end

  test "should get info" do
    log_in(users(:anchieta))

    assert_not_empty cookies[:user_id]
    get info_url
    assert_response :success
  end
end
