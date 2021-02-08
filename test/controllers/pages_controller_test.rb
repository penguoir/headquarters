require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "redirects to login page when going to home page" do
    get root_url
    assert_redirected_to new_user_session_url
  end
end
