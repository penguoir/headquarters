require 'test_helper'

class PinsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @pin = pins(:ori_pins_museum)
  end

  test "should create pin" do
    sign_in users(:ori)
    post pin_project_url(@pin.project)

    assert @pin.pinned
    assert_redirected_to project_url(@pin.project)
  end

  test "should unpin" do
    sign_in users(:ori)

    delete pin_project_url(@pin.project)
    assert_redirected_to project_url(@pin.project)
    refute Pin.where(id: @pin.id).last.pinned
  end
end
