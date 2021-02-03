require 'test_helper'

class PinTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can't have two pins for the same project" do
    pins(:ori_pins_museum)
    refute Pin.new(user: users(:ori), project: projects(:museum)).valid?
  end
end
