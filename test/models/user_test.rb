require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User#display_name shows a display name" do
    assert_equal "Ori", users(:ori).display_name
  end

  test "User#pinned_projects returns pinned projects" do
    assert_equal [projects(:museum)], users(:ori).pinned_projects
  end
end
